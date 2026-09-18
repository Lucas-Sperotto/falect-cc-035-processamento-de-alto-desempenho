from concurrent.futures import ThreadPoolExecutor
import threading
import time


def tarefa(id_tarefa):
    print(
        f"Tarefa {id_tarefa} em "
        f"{threading.current_thread().name}"
    )

    time.sleep(1)
    return id_tarefa * 2


with ThreadPoolExecutor(max_workers=4) as executor:
    resultados = list(executor.map(tarefa, range(8)))

print("Resultados:", resultados)
