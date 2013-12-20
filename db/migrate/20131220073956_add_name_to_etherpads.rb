class AddNameToEtherpads < ActiveRecord::Migration
  def change
    add_column :etherpads, :name, :string
  end
end
