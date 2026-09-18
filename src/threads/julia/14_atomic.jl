contador = Threads.Atomic{Int}(0)

Threads.@threads for _ in 1:1_000_000
    Threads.atomic_add!(contador, 1)
end

println("Contador = ", contador[])
