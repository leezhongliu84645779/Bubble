class AddPositionToChatroom < ActiveRecord::Migration[5.0]
  def change
    add_column :chatrooms, :position, :string
  end
end
