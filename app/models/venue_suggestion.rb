class VenueSuggestion < ActiveRecord::Base
  attr_accessible :name, :address

  belongs_to :user
  belongs_to :city

  validates :name, :presence => true
  validates :address, :presence => true

  def to_s
    name
  end

end
