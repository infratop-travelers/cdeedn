class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :post_code, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :street, null: false
      t.integer :customer_id, null: false
      t.timestamps
    end
  end
end
