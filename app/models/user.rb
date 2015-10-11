class User < ActiveRecord::Base
	has_many :comment, dependent: :destroy
	has_many :pin, dependent: :destroy
	has_many :pin_likes, dependent: :destroy
	has_many :comment_likes, dependent: :destroy
	attr_accessor :password
	before_save :encrypt_password
	default_scope {select([:uid, :email, :birthday, :gender])}

	def encrypt_password
		uid = User.maximum(:uid)
  		self.uid = uid.to_i + 1
		self.password_salt = BCrypt::Engine.generate_salt
		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	end
	
	def self.authenticate(email, password)
		user = User.where(email: email).first
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end
end