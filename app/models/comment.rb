class Comment < ActiveRecord::Base
  	has_many :comment_like, dependent: :destroy
	belongs_to :pin
	belongs_to :user
  	attr_accessor :like_count, :liked

  	def attributes
  		super.merge({'like_count' => self.like_count, 'liked' => self.liked})
	end
end
