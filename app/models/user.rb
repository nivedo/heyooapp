class User < ActiveRecord::Base
  has_many :usergroups
  has_many :memberships, through: :usergroups, class_name: 'Group', source: :group
  

  has_secure_password

  before_save { |user| user.email = email.downcase }

  validates :email, uniqueness: true

  has_many :contents, dependent: :destroy

  def display_name
    return first_name.titleize + ' ' + last_name[0].capitalize
  end
end
