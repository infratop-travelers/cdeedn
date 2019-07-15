class CreateResignedCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :resigned_customers do |t|
      t.integer :customer_id, null: false
      t.timestamps
    end
  end
end
