class CheckIn < ActiveRecord::Base
  belongs_to :venue
  belongs_to :user

  validates :venue_id, :presence => true
  validates :user_id, :presence => true
end
