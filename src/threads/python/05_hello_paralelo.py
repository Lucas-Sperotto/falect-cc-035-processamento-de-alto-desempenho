import threading


def tarefa(id_thread):
    print(f"Hello da thread {id_thread}")


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

print("Todas terminaram.")
