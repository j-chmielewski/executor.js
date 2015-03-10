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
            transcript = result[0].transcript.trim()
            @execute(transcript)
            break

      recognition.onerror = () =>
        console.log 'onerror'
      recognition.onend = () =>
        console.log 'onend'

      recognition.start()

  execute: (sentence) ->
    [command, params...] = sentence.split(' ')
    if command of @commands
      console.log "[EXE] #{new Date()} #{command} #{params}"
      @commands[command].apply(undefined, params)


window.Executor = Executor