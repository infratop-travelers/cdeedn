class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :image_id, null: false
      t.integer :singer_id, null:false
      t.string :name, null:false
      t.integer :price, null:false
      t.integer :label_id, null:false
      t.integer :genre_id, null:false
      t.integer :stock, null:false
      t.integer :delivery_status, null:false
      t.timestamps
    end
  end
end
