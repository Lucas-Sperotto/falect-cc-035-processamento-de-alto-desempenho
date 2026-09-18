Threads.@threads for i in 1:4
    println(
        "Hello da thread ",
        Threads.threadid(),
        " na iteração ",
        i
    )
end
