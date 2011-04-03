Factory.define :venue_photo do |f|
  include ActionDispatch::TestProcess
  f.image { fixture_file_upload("spec/support/files/venue_photo.jpg") }
end
