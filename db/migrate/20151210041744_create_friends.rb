class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :uid
      t.integer :suid

      t.timestamps null: false
    end
  end
end
