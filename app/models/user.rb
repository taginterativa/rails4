class User < ActiveRecord::Base
  has_many :my_presentations,
    :dependent => :destroy,
    :class_name => "Presentation",
    :foreign_key => "owner_id"
  has_many :my_groups,
    :dependent => :destroy,
    :class_name => "Group",
    :foreign_key => "owner_id"
  has_and_belongs_to_many :member_of,
    :class_name => "Group",
    :foreign_key => "user_id",
    :association_foreign_key => "group_id"

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
end
