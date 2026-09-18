import threading

atual = threading.current_thread()
print("Thread atual:", atual.name)
