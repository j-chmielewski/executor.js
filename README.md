```
var commands =   {
  alert: function(message) {
      alert(message);
    }
}

exe = new Executor({
  commands: commands
  debug: true
})
exe.start();
```
