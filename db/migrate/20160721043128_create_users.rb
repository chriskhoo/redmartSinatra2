class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # no need index

      t.string    :name, null: false, limit: 50
      t.string    :email, null: false, limit: 50
      t.string    :address
      t.string    :password, null: false, limit: 50
      t.string    :cc_number, null: false, limit: 25

      #must always have timestamps!
      t.timestamps
    end
  end
end
