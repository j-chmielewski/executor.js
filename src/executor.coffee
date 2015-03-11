class Executor
  constructor: (options) ->
    @commands = options.commands ? {}
    @lang = options.lang ? 'en-US'
    @debug = options.debug ? false

  start: () ->
    if not 'webkitSpeechRecognition' in window
      @log 'No web speech engine'
    else
      @log 'Engine start'
      recognition = new webkitSpeechRecognition()
      recognition.continuous = true
      recognition.lang = @lang
      recognition.interimResults = false

      recognition.onstart = () =>
        @log 'OnStart'

      recognition.onresult = () =>
        for result in event.results by -1
          if result.isFinal
            transcript = result[0].transcript.trim()
            @log "REC: #{transcript}"
            @execute(transcript)
            break

      recognition.onerror = () =>
        @log 'OnError'

      recognition.onend = () =>
        @log 'OnEnd'

      recognition.start()

  execute: (sentence) ->
    [command, params...] = sentence.split(' ')
    if command of @commands
      @log "CMD: #{command} [#{params}]"
      @commands[command].apply(undefined, params)

  log: (message) ->
    console.log "[EXE] #{message}"
    if @debug
      exe_console = document.getElementById('exe-console')
      log_div = document.createElement('div')
      log_div.innerHTML = "[EXE] #{message}"
      exe_console.appendChild(log_div)
      exe_console.scrollTop = exe_console.scrollHeight


window.Executor = Executor