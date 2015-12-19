class AddMoodToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mood, :string
  end
end
