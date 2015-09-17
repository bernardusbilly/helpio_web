class ChangeUserIdToUid < ActiveRecord::Migration
  def change
  	rename_column :comments, :user_id, :uid
  end
end
