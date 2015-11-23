class Pin < ActiveRecord::Base
  	has_many :comment, dependent: :destroy
  	has_many :pin_like, dependent: :destroy
  	attr_accessor :nickname, :prof_img, :comment_count, :like_count, :liked
	require 'rubygems'
	require 'ImageResize'

  	def attributes
  		super.merge({'nickname' => self.nickname, 'prof_img' => self.prof_img, 'comment_count' => self.comment_count, 'like_count' => self.like_count, 'liked' => self.liked})
	end

	def uploaded_file=(fileobj)
	    name = unique_and_proper_filename(fileobj.original_filename)
	    directory = "public/images/upload"
	    resize_directory = "public/images/upload/resize"
	    path = File.join(directory, name)
	    resize_path = File.join(resize_directory, name)
	    File.open(path, "wb") { |f| f.write(fileobj.read) }
	    self.img = name
	    Image.resize(path, resize_path, 50,50)
	    return true
	end

  	private
		def unique_and_proper_filename(filename)
			Time.now.to_i.to_s + "_" + File.basename(filename)
		end
end
