class AddGroupIdToEtherpads < ActiveRecord::Migration
  def change
    add_column :etherpads, :group_id, :integer
    add_index :etherpads, :group_id
  end
end
