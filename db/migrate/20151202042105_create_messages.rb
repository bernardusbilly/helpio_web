class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :uid
      t.integer :suid

      t.timestamps null: false
    end
  end
end
