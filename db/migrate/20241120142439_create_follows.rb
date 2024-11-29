class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
		
	  # follower: 구독을 신청을 받은 사람
	  # following: 구독 신청을 한 사람
      t.integer :follower_id
      t.integer :following_id

      t.timestamps
    end
	  add_index: follows, :follower_id
	  add_index: follows, :following_id
	  add_index: follows, :follower_id, :following_id, unique: true
	  
  end
end
