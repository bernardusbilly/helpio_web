class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :uid
      t.integer :pin_id
      t.string :title
      t.integer :category
      t.boolean :read

      t.timestamps null: false
    end
  end
end
