import threading
import time


def calcular(limite):
    soma = 0

    for i in range(limite):
        soma += i * i

    return soma


LIMITE = 8_000_000
resultados = [None] * 4


def tarefa(id_thread):
    resultados[id_thread] = calcular(LIMITE)


threads = []
inicio = time.perf_counter()

for i in range(4):
    thread = threading.Thread(
        target=tarefa,
        args=(i,),
    )
    threads.append(thread)

for thread in threads:
    thread.start()

for thread in threads:
    thread.join()

fim = time.perf_counter()

print(f"Tempo com threads: {fim - inicio:.2f} s")
print("Checksum:", sum(resultados))
