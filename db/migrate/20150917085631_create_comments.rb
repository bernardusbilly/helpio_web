class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :pin_id
      t.integer :user_id
      t.integer :like_count

      t.timestamps null: false
    end
  end
end
