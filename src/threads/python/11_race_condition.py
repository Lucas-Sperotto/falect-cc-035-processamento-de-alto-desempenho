import threading
import time

contador = 0


def incrementar():
    global contador

    for _ in range(1000):
        valor = contador
        time.sleep(0)
        contador = valor + 1


threads = [
    threading.Thread(target=incrementar)
    for _ in range(4)
]

for thread in threads:
    thread.start()

for thread in threads:
    thread.join()

print("Esperado:", 4000)
print("Obtido:  ", contador)
