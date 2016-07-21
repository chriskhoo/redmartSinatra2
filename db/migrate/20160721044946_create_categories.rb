class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      # no need index
      t.string    :name, null: false, limit: 50
      t.string :description, null: false
      #must always have timestamps!
      t.timestamps
    end
  end
end
