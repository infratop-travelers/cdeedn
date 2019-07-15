class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :item_id, null: false
      t.integer :price, null: false
      t.integer :count, null: false
      t.timestamps
    end
  end
end
