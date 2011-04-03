class VenuePhoto < ActiveRecord::Base
  belongs_to :venue

  has_attached_file :image, :styles => {
    :thumb => "50x50>",
    :small => "150x150>",
    :medium => "320x320>",
    :large => "600x600>"
  }

end
