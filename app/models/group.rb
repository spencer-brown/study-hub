class Group < ActiveRecord::Base
  has_and_belongs_to :user
  has_many :etherpads
end
