class MessageContent < ActiveRecord::Base
	belongs_to :user
  	attr_accessor :self_msg

  	def attributes
  		super.merge({'self_msg' => self.self_msg})
	end
end
