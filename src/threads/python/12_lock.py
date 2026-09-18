import threading

contador = 0
lock = threading.Lock()


def incrementar():
    global contador

    for _ in range(1000):
        with lock:
            contador += 1


threads = [
    threading.Thread(target=incrementar)
    for _ in range(4)
]

for thread in threads:
    thread.start()

for thread in threads:
    thread.join()

print("Contador:", contador)
