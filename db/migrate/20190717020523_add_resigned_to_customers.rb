class AddResignedToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :resigned, :boolean, default: false
  end
end
