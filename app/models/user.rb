class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :email_regexp => /.+@purdue.edu\z/i


  has_and_belongs_to_many :groups, -> { uniq }
  has_many :etherpads, :through => :groups

  validates :name, presence: true
end
