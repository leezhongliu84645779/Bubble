class AddChatroomToChatroompost < ActiveRecord::Migration[5.0]
  def change
    add_reference :chatroomposts, :chatroom, foreign_key: true
  end
end
