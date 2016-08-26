class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chatrooms:#{message.chatroom.id}", {
      message: "<div><strong>#{message.user.username}:</strong>#{message.body}</div>",
      chatroom_id: message.chatroom.id
    }
  end
end
