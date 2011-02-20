class City < ActiveRecord::Base
  attr_accessible :name
  
  has_many :users
  
  scope :active, where(:active => true)
  scope :inactive, where(:active => false)
  
  validates :name, :presence => true, :uniqueness => true

  def activate
    update_attribute(:active, true)
  end

  def deactivate
    update_attribute(:active, false)
  end
  
end
