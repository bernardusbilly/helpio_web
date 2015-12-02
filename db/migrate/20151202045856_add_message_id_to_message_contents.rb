class AddMessageIdToMessageContents < ActiveRecord::Migration
  def change
    add_column :message_contents, :mid, :integer
  end
end
