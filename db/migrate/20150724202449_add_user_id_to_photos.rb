class AddUserIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :user_id, :int
    add_index :photos, :user_id
  end
end
