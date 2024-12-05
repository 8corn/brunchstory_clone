class List < ApplicationRecord
  belongs_to :category
  belongs_to :user
	
  mount_uploader :avatar, AvatarUploader
end
