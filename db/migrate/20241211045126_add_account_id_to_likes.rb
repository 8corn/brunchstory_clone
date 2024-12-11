class AddAccountIdToLikes < ActiveRecord::Migration[6.0]
  def change
    add_reference :likes, :account, null: false, foreign_key: true
	remove_reference :likes, :user, foreign_key: true
  end
end
