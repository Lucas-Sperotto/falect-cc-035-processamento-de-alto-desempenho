vetor = collect(1:8)

t1 = Threads.@spawn sum(vetor[1:2])
t2 = Threads.@spawn sum(vetor[3:4])
t3 = Threads.@spawn sum(vetor[5:6])
t4 = Threads.@spawn sum(vetor[7:8])

somas = [
    fetch(t1),
    fetch(t2),
    fetch(t3),
    fetch(t4)
]

resultado = sum(somas)

println("Somas parciais = ", somas)
println("Resultado = ", resultado)
