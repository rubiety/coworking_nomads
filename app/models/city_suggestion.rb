class CitySuggestion < ActiveRecord::Base
  attr_accessible :name, :from_name, :from_email

  validates :name, :presence => true
  validates :from_name, :presence => true
  validates :from_email, :presence => true
end
