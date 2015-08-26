class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :uid
      t.string :userid
      t.string :nickname

      t.timestamps null: false
    end
  end
end
