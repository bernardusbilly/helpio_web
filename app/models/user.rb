class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  
	has_many :comment, dependent: :destroy
	has_many :pin, dependent: :destroy
	has_many :pin_likes, dependent: :destroy
	has_many :comment_likes, dependent: :destroy
	attr_accessor :password
	require 'rubygems'
	require 'ImageResize'
	before_save :encrypt_password
	# default_scope {select([:id, :email, :encrypted_password, :remember_created_at, :nickname, :prof_img, :birthday, :gender, :mood])}

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
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
		user = User.select([:id, :email, :encrypted_password, :password_hash, :password_salt, :nickname, :prof_img, :birthday, :gender, :mood]).where(email: email).first
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end

	def self.from_omniauth(auth)
	    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
	      user.provider = auth.provider
	      user.uid = auth.uid
	      user.nickname = auth.info.name
	      user.password = Devise.friendly_token[0, 20]
	      user.email = auth.info.email
	      gender = auth.extra.raw_info.gender
	      if gender == 'male'
	      	user.gender = 0
	      elsif gender == 'female'
	      	user.gender = 1
	      end
	      user.prof_img = auth.info.image
	      user.oauth_token = auth.credentials.token
	      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	      user.save!
	    end
	end

  	private
		def unique_and_proper_filename(filename)
			Time.now.to_i.to_s + "_" + File.basename(filename)
		end
end
