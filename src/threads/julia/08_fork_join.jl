println("ANTES DO FORK")

t1 = Threads.@spawn begin
    println("Tarefa A executando")
    sleep(1)
    10
end

t2 = Threads.@spawn begin
    println("Tarefa B executando")
    sleep(1)
    20
end

t3 = Threads.@spawn begin
    println("Tarefa C executando")
    sleep(1)
    30
end

r1 = fetch(t1)
r2 = fetch(t2)
r3 = fetch(t3)

println("Resultado = ", r1 + r2 + r3)
println("DEPOIS DO JOIN")
