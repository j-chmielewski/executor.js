exe = new Executor(
  test: () ->
    console.log 'test command'
)
exe.start()