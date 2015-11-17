class AddSuidToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :suid, :integer
    add_column :notifications, :comment_id, :integer
  end
end
