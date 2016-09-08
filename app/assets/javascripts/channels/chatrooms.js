App.chatrooms = App.cable.subscriptions.create("ChatroomsChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log(data)
    if (document.getElementById("message-board").dataset.value == data.chatroom_id){
      $("#message-board").append(data.message)
    }
  }
});
