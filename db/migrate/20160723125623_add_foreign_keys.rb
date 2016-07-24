class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :products, :brands
    add_foreign_key :products, :categories
  end
end
