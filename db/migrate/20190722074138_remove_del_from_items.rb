class RemoveDelFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :delivery_status, :integer
  end
end
