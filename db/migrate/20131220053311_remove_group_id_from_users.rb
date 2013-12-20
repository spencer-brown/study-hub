class RemoveGroupIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :group_id, :integer
  end
end
