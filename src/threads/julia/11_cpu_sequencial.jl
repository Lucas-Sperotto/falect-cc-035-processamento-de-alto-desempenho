function calcular(limite)
    soma = 0.0

    for i in 1:limite
        soma += sqrt(i) * sin(i)
    end

    return soma
end

limite = 5_000_000
calcular(1_000)

inicio = time()

resultados = [
    calcular(limite)
    for _ in 1:4
]

fim = time()

println(
    "Tempo sequencial = ",
    round(fim - inicio, digits=3),
    " s"
)

println("Checksum = ", sum(resultados))
