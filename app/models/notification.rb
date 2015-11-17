class Notification < ActiveRecord::Base
  	attr_accessor :nickname, :prof_img

  	def attributes
  		super.merge({'nickname' => self.nickname, 'prof_img' => self.prof_img})
	end
end
