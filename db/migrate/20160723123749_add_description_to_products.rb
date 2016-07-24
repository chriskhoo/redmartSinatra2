class AddDescriptionToProducts < ActiveRecord::Migration
  def change
    add_column :products, :description, :string, :null => false
  end
end
