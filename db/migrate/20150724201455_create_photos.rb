class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    	t.string :caption
    	t.string :picture

    	t.integer :user_id
    	t.integer :place_id
    	t.timestamps
    

 
    end
  end
end
