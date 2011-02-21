class City < ActiveRecord::Base
  attr_accessible :name
  
  has_many :users, :dependent => :nullify
  has_many :venues, :dependent => :destroy
  has_many :venue_suggestions, :dependent => :nullify
  
  scope :active, where(:active => true)
  scope :inactive, where(:active => false)

  has_friendly_id :name, :use_slug => true, :approximate_ascii => true
  
  validates :name, :presence => true, :uniqueness => true

  def to_s
    name
  end

  def activate
    update_attribute(:active, true)
  end

  def deactivate
    update_attribute(:active, false)
  end
  
end
