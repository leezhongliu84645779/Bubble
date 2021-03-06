class MessagesController < ApplicationController
   before_action :set_chatroom

   def create
      puts "the text message is"
      message_params[:body] = message_params[:body].strip
      puts message_params[:body]
   	@message = @chatroom.messages.new(message_params)
   	@message.user = current_user
   	@message.save
   	respond_to do |format|
   	  format.js{MessageRelayJob.perform_later(@message)}
   	  format.html {redirect_to @chatroom}
   	end
   end


   private
   def set_chatroom
   	 @chatroom = Chatroom.find(params[:chatroom_id])
   end

   def message_params
   	 params.require(:message).permit(:body)
   end
end