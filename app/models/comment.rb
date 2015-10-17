class Comment < ActiveRecord::Base
  	has_many :comment_like, dependent: :destroy
	belongs_to :pin
	belongs_to :user
  	attr_accessor :nickname, :prof_img, :like_count, :liked

  	def attributes
  		super.merge({'nickname' => self.nickname, 'prof_img' => self.prof_img, 'like_count' => self.like_count, 'liked' => self.liked})
	end
end
