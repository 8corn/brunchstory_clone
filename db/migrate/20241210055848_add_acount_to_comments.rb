class AddAcountToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :account, null: false, foreign_key: true
  end
end
