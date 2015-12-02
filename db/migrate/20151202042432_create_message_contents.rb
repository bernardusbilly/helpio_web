class CreateMessageContents < ActiveRecord::Migration
  def change
    create_table :message_contents do |t|
      t.integer :uid
      t.text :text
      t.boolean :read

      t.timestamps null: false
    end
  end
end
