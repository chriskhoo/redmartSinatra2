class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      # no need index
      t.string    :name, null: false, limit: 50

      #must always have timestamps!
      t.timestamps
    end
  end
end
