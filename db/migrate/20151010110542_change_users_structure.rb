class ChangeUsersStructure < ActiveRecord::Migration
  def change
  	rename_column :users, :userid, :email
  	add_column :users, :password_hash, :string, after: :email
  	add_column :users, :password_salt, :string, after: :password_hash
  	add_column :users, :birthday, :date, after: :nickname
  	add_column :users, :gender, :integer, after: :birthday
  end
end
