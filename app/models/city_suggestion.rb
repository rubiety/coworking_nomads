class CitySuggestion < ActiveRecord::Base
  validates :name, :presence => true
  validates :from_name, :presence => true
  validates :from_email, :presence => true
end
