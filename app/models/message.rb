class Message < ActiveRecord::Base
  	has_many :message_content, dependent: :destroy
	belongs_to :user
end
