class AddNumberToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :number, :string
  end
end
