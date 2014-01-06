class AddSubjectIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :subject_id, :integer
    add_index :groups, :subject_id
  end
end
