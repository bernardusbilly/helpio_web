class AddPasswordSaltToUser < ActiveRecord::Migration
  def change
  	add_column :users, :nickname, :string
  	add_column :users, :uid, :string
  	add_column :users, :prof_img, :string, after: :nickname
  	add_column :users, :mood, :string
  	add_column :users, :password_hash, :string, after: :email
  	add_column :users, :password_salt, :string, after: :password_hash
  	add_column :users, :birthday, :date, after: :nickname
  	add_column :users, :gender, :integer, after: :birthday
  	add_column :users, :provider, :string
  	add_column :users, :oauth_token, :string
  	add_column :users, :oauth_expires_at, :string
  end
end
