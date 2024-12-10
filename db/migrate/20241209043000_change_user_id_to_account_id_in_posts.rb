class ChangeUserIdToAccountIdInPosts < ActiveRecord::Migration[6.0]
  def change
	  rename_column :posts, :user_id, :account_id
  end
end
