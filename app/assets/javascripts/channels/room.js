App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
    console.log("tamahooooooooooom")
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(message) {
    const messages = document.getElementById('messages')
    messages.innerHTML += message
    // Called when there's incoming data on the websocket for this channel
  },

  speak: function(content) {
    return this.perform('speak', {message: content});
  }
});

document.addEventListener('DOMContentLoaded', function(){
  input = document.getElementById('chat-input')
  button = document.getElementById('button')
  button.addEventListener('click', function(){
    content = input.value
    if(content != nil){
      App.room.speak(content)
    }else if(content.length > 50){
      alert("50字以内で入力して下さい")
    }
    input.value = ""
  })
})