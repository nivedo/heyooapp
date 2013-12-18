

class Group < ActiveRecord::Base
  has_many :messages
  

  has_many :usergroups, :uniq => true
  has_many :members, through: :usergroups, class_name: 'User', source: :user, :uniq => true
end


