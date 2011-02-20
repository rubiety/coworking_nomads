class Venue < ActiveRecord::Base
  attr_accessible :name

  belongs_to :city
  has_many :reviews

  scope :active, where(:active => true)
  scope :inactive, where(:active => false)

  validates :name, :presence => true, :uniqueness => true
  validates :city_id, :presence => true

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
