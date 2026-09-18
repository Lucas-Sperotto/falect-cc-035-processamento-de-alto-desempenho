import time

inicio = time.perf_counter()

for i in range(4):
    print(f"Iniciando tarefa {i}")
    time.sleep(1)
    print(f"Terminando tarefa {i}")

fim = time.perf_counter()

print(f"Tempo: {fim - inicio:.2f} s")
