import threading


def tarefa():
    atual = threading.current_thread()
    print("Executando em:", atual.name)


thread = threading.Thread(
    target=tarefa,
    name="Trabalhadora-1",
)

thread.start()
thread.join()
