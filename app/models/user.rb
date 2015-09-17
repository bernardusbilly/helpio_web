class User < ActiveRecord::Base
	has_many :comment, dependent: :destroy
end
