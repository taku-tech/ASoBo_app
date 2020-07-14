class RemoveUserIdFromWords < ActiveRecord::Migration[5.2]
  def change
    remove_column :words, :user_id, :integer
  end
end
