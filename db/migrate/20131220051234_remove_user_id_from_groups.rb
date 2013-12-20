class RemoveUserIdFromGroups < ActiveRecord::Migration
  def change
    remove_index :groups, :user_id
    remove_column :groups, :user_id, :integer
  end
end
