class CreateEtherpads < ActiveRecord::Migration
  def change
    create_table :etherpads do |t|

      t.timestamps
    end
  end
end
