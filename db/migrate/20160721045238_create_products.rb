class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :brand_id, null: false
      t.string :category_id, null:false

      #need to update to double precision
      t.float :price, null:false
      t.timestamps
    end
  end
end
