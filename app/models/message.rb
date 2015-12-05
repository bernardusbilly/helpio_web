class Message < ActiveRecord::Base
  	has_many :message_content, dependent: :destroy
	belongs_to :user
  	attr_accessor :nickname, :prof_img, :last_text

  	def attributes
  		super.merge({'nickname' => self.nickname, 'prof_img' => self.prof_img, 'last_text' => self.last_text})
	end
end
