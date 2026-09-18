import threading


def tarefa():
    print("Hello da thread!")


thread = threading.Thread(target=tarefa)
thread.start()
thread.join()
