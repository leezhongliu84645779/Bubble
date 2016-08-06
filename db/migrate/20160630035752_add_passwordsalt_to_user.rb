class AddPasswordsaltToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :passwordsalt, :string
  end
end
