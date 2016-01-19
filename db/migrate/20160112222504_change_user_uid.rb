class ChangeUserUid < ActiveRecord::Migration
  def change
  	change_column :users, :uid, :string, :null => false, :default => ""
  end
end
