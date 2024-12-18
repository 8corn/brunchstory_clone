class Post < ApplicationRecord
	belongs_to :category
	belongs_to :account
	has_many :comments
	has_many :likes, dependent: :destroy
	validates :title, presence: true
  	validates :content, presence: true
end
