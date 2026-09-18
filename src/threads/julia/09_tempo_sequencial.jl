inicio = time()

for i in 1:4
    println("Tarefa ", i, " iniciou")
    sleep(1)
    println("Tarefa ", i, " terminou")
end

fim = time()

println(
    "Tempo = ",
    round(fim - inicio, digits=2),
    " s"
)
