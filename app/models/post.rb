class Post < ApplicationRecord
  belongs_to :user
	has_many :comments
	has_many :likes
	has_and_belongs_to_many :categoryies
end
