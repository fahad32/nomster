class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|

    	t.string :name
    	t.text :description
    	t.text :address

      t.timestamps
    end
  end
end
