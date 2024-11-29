class Follow < ApplicationRecord
	#구독 신청한 유저 
	#관계 이름:following
	#모델 명: User
	belongs_to:following, class_name:"User"
	
	#구독 신청을 받은 유저
	#관계 이름:follower
	#모델 명: User
	belongs_to:follower, class_name:"User"
end
