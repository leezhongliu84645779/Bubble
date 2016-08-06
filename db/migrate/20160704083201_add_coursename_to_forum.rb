class AddCoursenameToForum < ActiveRecord::Migration[5.0]
  def change
    add_column :forums, :coursename, :string
  end
end
