class User < ActiveRecord::Base
	has_many :comment, dependent: :destroy
	has_many :pin, dependent: :destroy
	has_many :pin_likes, dependent: :destroy
	has_many :comment_likes, dependent: :destroy
	attr_accessor :password
	require 'rubygems'
	require 'ImageResize'
	before_save :encrypt_password
	default_scope {select([:id, :email, :nickname, :prof_img, :birthday, :gender, :mood])}

	def encrypt_password
		self.password_salt = BCrypt::Engine.generate_salt
		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	end

	def uploaded_file=(fileobj)
	    name = unique_and_proper_filename(fileobj.original_filename)
	    directory = "public/images/prof_img"
	    resize_directory = "public/images/prof_img/resize"
	    path = File.join(directory, name)
	    resize_path = File.join(resize_directory, name)
	    File.open(path, "wb") { |f| f.write(fileobj.read) }
	    self.prof_img = name
	    Image.resize(path, resize_path, 50,50)
	    return true
	end
	
	def self.authenticate(email, password)
		user = User.select([:email, :password_hash, :password_salt, :nickname, :birthday, :gender]).where(email: email).first
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end

  	private
		def unique_and_proper_filename(filename)
			Time.now.to_i.to_s + "_" + File.basename(filename)
		end
end
