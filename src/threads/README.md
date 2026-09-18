# Threads, MIMD, memória compartilhada e Fork–Join

Exemplos da aula introdutória de threads da disciplina **FALECT-CC-035 — Processamento de Alto Desempenho**.

```text
problema
   ↓
decomposição
   ↓
Fork
   ↓
trabalho concorrente/paralelo
   ↓
sincronização
   ↓
Join
   ↓
resultado
```

## Diretórios

- `c_openmp/`: C com OpenMP;
- `java/`: `Thread`, `Runnable`, sincronização e Fork/Join Framework;
- `python/`: `threading`, locks, I/O-bound, CPU-bound e GIL;
- `julia/`: `Threads.@threads`, `Threads.@spawn`, atomics e locks.

## Execução

Na raiz do repositório:

```bash
chmod +x scripts/check_threads_env.sh scripts/run_threads.sh
./scripts/check_threads_env.sh
./scripts/run_threads.sh
```

O padrão usa quatro threads. Para alterar:

```bash
THREADS=2 ./scripts/run_threads.sh
THREADS=8 ./scripts/run_threads.sh
```

Modos disponíveis:

```bash
./scripts/run_threads.sh demo
./scripts/run_threads.sh all
./scripts/run_threads.sh benchmark
```

- `demo`: conjunto curto para demonstração em sala;
- `all`: executa todos os exemplos didáticos;
- `benchmark`: executa exemplos de comparação de tempo.

Os executáveis e classes compiladas são criados em `build/threads/` e não são versionados.

## Observações didáticas

Os arquivos com `race_condition` contêm erros de sincronização **intencionais**. O resultado pode variar entre execuções e, ocasionalmente, coincidir com o valor esperado.

Nos exemplos Python, a discussão sobre GIL refere-se principalmente ao CPython convencional com o GIL habilitado. Builds free-threaded possuem comportamento diferente.

Os exemplos com `sleep` demonstram sobreposição temporal e concorrência; eles não são benchmarks de computação CPU-bound.
