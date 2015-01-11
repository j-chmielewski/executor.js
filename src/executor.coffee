class Executor
  constructor: (@commands) ->

  start: () ->
    if not 'webkitSpeechRecognition' in window
      console.error 'No web speech engine'
    else
      console.log 'EXE engine start'
      recognition = new webkitSpeechRecognition()
      recognition.continuous = true
      recognition.interimResults = false

      recognition.onstart = () =>
        console.log 'onstart'
      recognition.onresult = () =>
        for result in event.results by -1
          if result.isFinal
            console.log "#{new Date()} #{result[0].transcript}"
            @execute(result[0].transcript)
            break

        console.log 'onresult'
      recognition.onerror = () =>
        console.log 'onerror'
      recognition.onend = () =>
        console.log 'onend'

      recognition.start()

  execute: (sentence) ->
    [command, params...] = sentence.split(' ')
    if command of @commands
      @commands[command].apply(undefined, params)


window.Executor = Executor