class AddCategoryToChatroom < ActiveRecord::Migration[5.0]
  def change
    add_column :chatrooms, :category, :string
  end
end
