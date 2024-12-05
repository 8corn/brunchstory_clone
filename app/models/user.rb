class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	has_secure_password
	has_many :posts
	has_many :comments
	has_many :likes
	
	#관계 이름: follower_relations
	#외래키: following_id
	#모델명: Follow
	has_many :follower_relations, foreign_key:"following_id", class_name: "Follow"
	
	#관계 이름: followers
	# follow_relations를 통해 가져올 값: follower(follow,follower)
	has_many :followers, through: :follower_relations, source: :follower
	
	has_many :follower_relations, foreign_key: "follower_id", class_name: "Follow"
	has_many :followers, through: :follower_relations, source: :follower
	
	has_many :following_relations, foreign_key: "following_id", class_name: "Follow"
    has_many :followings, through: :following_relations, source: :following
end
