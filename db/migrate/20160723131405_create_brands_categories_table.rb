class CreateBrandsCategoriesTable < ActiveRecord::Migration
  def change
    create_join_table :brands, :categories
  end
end
