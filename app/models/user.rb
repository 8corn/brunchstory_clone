class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	has_secure_password
	has_many :posts
	has_many :comments
	has_many :likes
	has_many :followed_users, class_name: "Follow", foreign_key: "follower"
	has_many :followers, class_name: "Follow", foreign_key: "following"
end
