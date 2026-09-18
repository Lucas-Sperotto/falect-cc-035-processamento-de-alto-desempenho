function executar_tarefas(n; atraso=1.0, mostrar=true)
    for i in 1:n
        if mostrar
            println("Tarefa ", i, " iniciou")
        end

        sleep(atraso)

        if mostrar
            println("Tarefa ", i, " terminou")
        end
    end
end

# Aquecimento: força a compilação do caminho usado no experimento
# antes de iniciar a medição. O atraso zero evita acrescentar
# espera significativa.
executar_tarefas(
    1;
    atraso=0.0,
    mostrar=false
)

inicio = time()

executar_tarefas(
    4;
    atraso=1.0,
    mostrar=true
)

fim = time()

println(
    "Tempo = ",
    round(fim - inicio, digits=2),
    " s"
)
