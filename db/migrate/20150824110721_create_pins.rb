class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.integer :uid
      t.string :title
      t.float :lon
      t.float :lat
      t.string :img

      t.timestamps null: false
    end
  end
end
