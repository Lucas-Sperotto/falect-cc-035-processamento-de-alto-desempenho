import time


def calcular(limite):
    soma = 0

    for i in range(limite):
        soma += i * i

    return soma


LIMITE = 8_000_000

inicio = time.perf_counter()
resultados = [calcular(LIMITE) for _ in range(4)]
fim = time.perf_counter()

print(f"Tempo sequencial: {fim - inicio:.2f} s")
print("Checksum:", sum(resultados))
