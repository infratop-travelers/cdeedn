class AddNameToDiscs < ActiveRecord::Migration[5.2]
  def change
    add_column :discs, :name, :string
  end
end
