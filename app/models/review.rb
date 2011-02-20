class Review < ActiveRecord::Base
  belongs_to :venue
  belongs_to :user

  scope :active, where(:active => true)
  scope :inactive, where(:active => false)

  validates :venue_id, :presence => true
  validates :user_id, :presence => true
  validates :rating, :inclusion => 1..10
  validates :wifi_rating, :inclusion => 1..10
  validates :ambiance_rating, :inclusion => 1..10
  validates :table_availability_rating, :inclusion => 1..10

  def activate
    update_attribute(:active, true)
  end

  def deactivate
    update_attribute(:active, false)
  end

end
