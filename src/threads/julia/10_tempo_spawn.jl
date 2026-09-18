inicio = time()
tarefas = Task[]

for i in 1:4
    t = Threads.@spawn begin
        println("Tarefa ", i, " iniciou")
        sleep(1)
        println("Tarefa ", i, " terminou")
    end

    push!(tarefas, t)
end

for tarefa in tarefas
    wait(tarefa)
end

fim = time()

println(
    "Tempo = ",
    round(fim - inicio, digits=2),
    " s"
)
