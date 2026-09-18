contador = Ref(0)
meu_lock = ReentrantLock()

Threads.@threads for _ in 1:100_000
    lock(meu_lock) do
        contador[] += 1
    end
end

println("Contador = ", contador[])
