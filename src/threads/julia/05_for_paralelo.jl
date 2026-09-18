Threads.@threads for i in 1:12
    println(
        "Thread ",
        Threads.threadid(),
        " executou ",
        i
    )
end
