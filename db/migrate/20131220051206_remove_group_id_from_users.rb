class RemoveGroupIdFromUsers < ActiveRecord::Migration
  def change
    remove_index :users, :group_id
    remove_column :users, :group_id, :integer
  end
end
