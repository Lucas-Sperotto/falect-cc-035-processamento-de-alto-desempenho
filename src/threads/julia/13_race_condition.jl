contador = Ref(0)

Threads.@threads for _ in 1:1_000_000
    contador[] += 1
end

println("Esperado = 1000000")
println("Obtido   = ", contador[])
