class Review < ActiveRecord::Base
  belongs_to :venue
  belongs_to :user

  scope :active, where(:active => true)
  scope :inactive, where(:active => false)

  def activate
    update_attribute(:active, true)
  end

  def deactivate
    update_attribute(:active, false)
  end

end
