class AddContentToChatroomposts < ActiveRecord::Migration[5.0]
  def change
    add_column :chatroomposts, :content, :text
  end
end
