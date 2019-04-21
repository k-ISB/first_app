App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
    console.log("tamahooooooooooom")
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    const messages = document.getElementById('messages')
    messages.innerHTML += `<p>${data.userName}:<br>${data.content}</p>`
    // Called when there's incoming data on the websocket for this channel
  },

  speak: function(userId, content) {
    return this.perform('speak', {content: content, userId: userId});
  }
});

document.addEventListener('DOMContentLoaded', function(){
  const input = document.getElementById('chat-input')
  const button = document.getElementById('button')
  button.addEventListener('click', function(){
    const userId = $('.current_user_id').val();
    const content = input.value
    App.room.speak(userId, content)
    input.value = ""
    console.log("jsは作動してる")
  })
})