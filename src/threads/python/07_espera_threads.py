import threading
import time


def tarefa(id_thread):
    print(f"Thread {id_thread} iniciou")
    time.sleep(1)
    print(f"Thread {id_thread} terminou")


inicio = time.perf_counter()
threads = []

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

print(f"Tempo: {fim - inicio:.2f} s")
