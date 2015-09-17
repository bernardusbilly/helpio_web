class CreatePinLikes < ActiveRecord::Migration
  def change
    create_table :pin_likes do |t|
      t.integer :pin_id
      t.integer :uid

      t.timestamps null: false
    end
  end
end
