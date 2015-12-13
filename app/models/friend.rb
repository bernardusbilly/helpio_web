class Friend < ActiveRecord::Base
	belongs_to :user
  	attr_accessor :nickname, :prof_img, :is_new

  	def attributes
  		super.merge({'nickname' => self.nickname, 'prof_img' => self.prof_img, 'is_new' => self.is_new})
	end
end
