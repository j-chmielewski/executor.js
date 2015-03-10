class Executor
  constructor: (@commands, @lang='en-US') ->

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
        @log 'onstart'

      recognition.onresult = () =>
        for result in event.results by -1
          if result.isFinal
            transcript = result[0].transcript.trim()
            @execute(transcript)
            break

      recognition.onerror = () =>
        @log 'onerror'

      recognition.onend = () =>
        @log 'onend'

      recognition.start()

  execute: (sentence) ->
    [command, params...] = sentence.split(' ')
    if command of @commands
      console.log "[EXE] #{new Date()} #{command} #{params}"
      @commands[command].apply(undefined, params)

  log: (message) ->
    console.log "[EXE] #{message}"


window.Executor = Executor