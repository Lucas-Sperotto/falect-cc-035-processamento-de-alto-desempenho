#!/usr/bin/env bash
set -euo pipefail

MODE="${1:-demo}"
THREADS="${THREADS:-4}"

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$ROOT/src/threads"
BUILD="$ROOT/build/threads"

if ! [[ "$THREADS" =~ ^[1-9][0-9]*$ ]]; then
    echo "THREADS deve ser um inteiro positivo." >&2
    exit 2
fi

case "$MODE" in
    demo|all|benchmark) ;;
    *)
        echo "Uso: $0 [demo|all|benchmark]" >&2
        exit 2
        ;;
esac

mkdir -p "$BUILD/c" "$BUILD/java"

linha() {
    printf '\n============================================================\n'
}

titulo() {
    linha
    echo "$1"
    linha
}

tem() {
    command -v "$1" >/dev/null 2>&1
}

compilar_c() {
    tem gcc || return

    echo "Compilando fontes C/OpenMP..."

    for fonte in "$SRC"/c_openmp/*.c; do
        nome="$(basename "$fonte" .c)"

        gcc -O2 -Wall -Wextra -fopenmp             "$fonte"             -o "$BUILD/c/$nome"
    done
}

compilar_java() {
    tem javac || return

    echo "Compilando fontes Java..."
    rm -rf "$BUILD/java"
    mkdir -p "$BUILD/java"

    javac -d "$BUILD/java" "$SRC"/java/*.java
}

validar_python() {
    tem python3 || return

    echo "Validando sintaxe dos fontes Python..."

    SRC_PY="$SRC/python" python3 - <<'PY'
import os
from pathlib import Path

root = Path(os.environ["SRC_PY"])

for path in sorted(root.glob("*.py")):
    source = path.read_text(encoding="utf-8")
    compile(source, str(path), "exec")

print("Sintaxe Python: OK")
PY
}

executar_c_demo() {
    [ -x "$BUILD/c/01_hello_sequencial" ] || return

    titulo "C / OpenMP"

    "$BUILD/c/01_hello_sequencial"
    OMP_NUM_THREADS="$THREADS" "$BUILD/c/02_hello_openmp"
    OMP_NUM_THREADS="$THREADS" "$BUILD/c/06_fork_join"
    OMP_NUM_THREADS="$THREADS" "$BUILD/c/08_for_paralelo"

    echo
    echo "--- Race condition intencional ---"
    OMP_NUM_THREADS="$THREADS" "$BUILD/c/12_race_condition"

    echo
    echo "--- Correção com atomic ---"
    OMP_NUM_THREADS="$THREADS" "$BUILD/c/14_atomic"

    echo
    echo "--- Reduction ---"
    OMP_NUM_THREADS="$THREADS" "$BUILD/c/13_reduction"
}

executar_c_all() {
    [ -x "$BUILD/c/01_hello_sequencial" ] || return

    titulo "C / OpenMP — todos os exemplos"

    for programa in "$BUILD"/c/*; do
        OMP_NUM_THREADS="$THREADS" "$programa"
        echo
    done
}

executar_java_demo() {
    [ -d "$BUILD/java" ] || return
    tem java || return

    titulo "Java Threads"

    for classe in         HelloSequencial MainThread HelloParalelo StartVsRun         RaceCondition ContadorAtomico VetorParalelo SomaForkJoin
    do
        echo "--- $classe ---"
        java -cp "$BUILD/java" "$classe"
        echo
    done
}

executar_java_all() {
    [ -d "$BUILD/java" ] || return
    tem java || return

    titulo "Java Threads — todos os exemplos"

    for classe in         HelloSequencial MainThread HelloThread StartVsRun HelloParalelo         ThreadsLoop ExemploRunnable Trabalho TempoSequencial TempoParalelo         RaceCondition ContadorSincronizado ContadorAtomico VetorSequencial         VetorParalelo Processadores SomaForkJoin
    do
        echo "--- $classe ---"
        java -cp "$BUILD/java" "$classe"
        echo
    done
}

executar_python_demo() {
    tem python3 || return

    titulo "Python threading"

    for arquivo in         01_hello_sequencial.py 02_main_thread.py 05_hello_paralelo.py         07_espera_threads.py 10_verifica_gil.py 11_race_condition.py         12_lock.py 13_vetor_threads.py
    do
        echo "--- $arquivo ---"
        python3 "$SRC/python/$arquivo"
        echo
    done
}

executar_python_all() {
    tem python3 || return

    titulo "Python threading — todos os exemplos"

    for arquivo in "$SRC"/python/*.py; do
        echo "--- $(basename "$arquivo") ---"
        python3 "$arquivo"
        echo
    done
}

executar_julia_demo() {
    tem julia || return

    titulo "Julia Threads"

    for arquivo in         01_hello_sequencial.jl 02_info_threads.jl 03_hello_threads.jl         05_for_paralelo.jl 08_fork_join.jl 13_race_condition.jl         14_atomic.jl 16_reducao.jl
    do
        echo "--- $arquivo ---"
        julia -t "$THREADS" "$SRC/julia/$arquivo"
        echo
    done
}

executar_julia_all() {
    tem julia || return

    titulo "Julia Threads — todos os exemplos"

    for arquivo in "$SRC"/julia/*.jl; do
        echo "--- $(basename "$arquivo") ---"
        julia -t "$THREADS" "$arquivo"
        echo
    done
}

executar_benchmarks() {
    titulo "Comparações de tempo"

    if [ -x "$BUILD/c/10_tempo_sequencial" ]; then
        echo "--- C: espera sequencial ---"
        "$BUILD/c/10_tempo_sequencial"
        echo
        echo "--- C/OpenMP: espera paralela ---"
        OMP_NUM_THREADS="$THREADS" "$BUILD/c/11_tempo_paralelo"
        echo
    fi

    if tem java && [ -d "$BUILD/java" ]; then
        echo "--- Java: sequencial ---"
        java -cp "$BUILD/java" TempoSequencial
        echo
        echo "--- Java: paralelo ---"
        java -cp "$BUILD/java" TempoParalelo
        echo
    fi

    if tem python3; then
        echo "--- Python: CPU-bound sequencial ---"
        python3 "$SRC/python/08_cpu_sequencial.py"
        echo
        echo "--- Python: CPU-bound com threads ---"
        python3 "$SRC/python/09_cpu_threads.py"
        echo
    fi

    if tem julia; then
        echo "--- Julia: CPU-bound sequencial ---"
        julia -t "$THREADS" "$SRC/julia/11_cpu_sequencial.jl"
        echo
        echo "--- Julia: CPU-bound paralelo ---"
        julia -t "$THREADS" "$SRC/julia/12_cpu_paralelo.jl"
        echo
    fi
}

titulo "FALECT-CC-035 — Threads, MIMD e Fork–Join"
echo "Modo: $MODE"
echo "Threads configuradas: $THREADS"

compilar_c
compilar_java
validar_python

case "$MODE" in
    demo)
        executar_c_demo
        executar_java_demo
        executar_python_demo
        executar_julia_demo
        ;;
    all)
        executar_c_all
        executar_java_all
        executar_python_all
        executar_julia_all
        ;;
    benchmark)
        executar_benchmarks
        ;;
esac

titulo "Execução concluída"
echo "Artefatos de compilação: build/threads/"
