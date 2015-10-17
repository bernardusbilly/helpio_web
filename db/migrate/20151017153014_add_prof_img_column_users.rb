class AddProfImgColumnUsers < ActiveRecord::Migration
  def change
  	add_column :users, :prof_img, :string, after: :nickname
  end
end
