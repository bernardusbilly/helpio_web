class Notification < ActiveRecord::Base
  	attr_accessor :nickname, :prof_img, :lat, :lon, :liked, :comment_count, :like_count

  	def attributes
  		super.merge({'nickname' => self.nickname, 'prof_img' => self.prof_img, 
  					 'lat' => self.lat, 'lon' => self.lon, 'liked' => self.liked, 
  					 'comment_count' => self.comment_count, 'like_count' => self.like_count})
	end
end
