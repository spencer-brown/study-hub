class Group < ActiveRecord::Base
  has_and_belongs_to_many :users, -> { uniq }
  has_many :etherpads
  def groupname
    "#{group.name}"
  end
end
