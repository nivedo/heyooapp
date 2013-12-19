

class Group < ActiveRecord::Base
  has_many :messages
  

  has_many :usergroups, :uniq => true
  has_many :members, through: :usergroups, class_name: 'User', source: :user, :uniq => true

  validate :validate_tags

  def validate_tags
    errors.add(:members, "Groups must contain more than one person.") if members.length < 2
  end
end


