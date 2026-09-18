import threading

N = 20
NUM_THREADS = 4
vetor = [0] * N


def processar(id_thread, inicio, fim):
    for i in range(inicio, fim):
        vetor[i] = i * i

    print(f"Thread {id_thread}: [{inicio}, {fim - 1}]")


threads = []
bloco = N // NUM_THREADS

for t in range(NUM_THREADS):
    inicio = t * bloco
    fim = N if t == NUM_THREADS - 1 else inicio + bloco

    thread = threading.Thread(
        target=processar,
        args=(t, inicio, fim),
    )

    threads.append(thread)

for thread in threads:
    thread.start()

for thread in threads:
    thread.join()

print(vetor)
