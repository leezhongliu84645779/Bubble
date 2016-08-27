class CreateChatroomposts < ActiveRecord::Migration[5.0]
  def change
    create_table :chatroomposts do |t|
      t.string :author

      t.timestamps
    end
  end
end
