default_threads = Threads.nthreads(:default)
interactive_threads = Threads.nthreads(:interactive)

println("Julia: ", VERSION)
println("Threads no pool :default: ", default_threads)
println("Threads no pool :interactive: ", interactive_threads)
println("Thread atual: ", Threads.threadid())
println("Pool da thread atual: ", Threads.threadpool())
println("Maior ID de thread observável: ", Threads.maxthreadid())

if interactive_threads > 0
    println(
        "IDs do pool :interactive: 1:",
        interactive_threads
    )

    primeiro_default = interactive_threads + 1
    ultimo_default = interactive_threads + default_threads

    println(
        "IDs do pool :default: ",
        primeiro_default,
        ":",
        ultimo_default
    )
else
    println(
        "IDs do pool :default: 1:",
        default_threads
    )
end

println()
println(
    "Observação: Threads.nthreads() sem argumento informa "
    * "o tamanho do pool :default."
)
println(
    "Por isso, no Julia 1.12+, executar com -t 4 pode "
    * "mostrar quatro workers com IDs 2, 3, 4 e 5 quando "
    * "há uma thread :interactive com ID 1."
)
