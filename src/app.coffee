if not 'webkitSpeechRecognition' in window
  console.log 'No web speech engine'
else
  console.log 'Engine start'
  recognition = new webkitSpeechRecognition();
  recognition.continuous = true;
  recognition.interimResults = true;

  recognition.onstart = () ->
    console.log 'onstart'
  recognition.onresult = () ->
    console.log 'onresult'
  recognition.onerror = () ->
    console.log 'onerror'
  recognition.onend = () ->
    console.log 'onend'

  recognition.start()