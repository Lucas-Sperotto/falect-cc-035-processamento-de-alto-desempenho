#!/usr/bin/env bash
set -u

echo "============================================================"
echo " FALECT-CC-035 — ambiente para a aula de threads"
echo "============================================================"
echo

if command -v nproc >/dev/null 2>&1; then
    echo "CPUs lógicas visíveis: $(nproc)"
fi

if command -v lscpu >/dev/null 2>&1; then
    echo
    lscpu | grep -E '^(Architecture|CPU\(s\)|Core\(s\) per socket|Socket\(s\)|Thread\(s\) per core):' || true
fi

echo

for comando in gcc java javac python3 julia; do
    if command -v "$comando" >/dev/null 2>&1; then
        echo "[OK] $comando -> $(command -v "$comando")"
    else
        echo "[--] $comando não encontrado"
    fi
done

echo

if command -v gcc >/dev/null 2>&1; then
    gcc --version | head -n 1
fi

if command -v java >/dev/null 2>&1; then
    java --version 2>&1 | head -n 1
fi

if command -v javac >/dev/null 2>&1; then
    javac --version
fi

if command -v python3 >/dev/null 2>&1; then
    python3 --version
fi

if command -v julia >/dev/null 2>&1; then
    julia --version
fi
