Factory.define :venue_suggestion do |f|
  f.association :user
  f.association :city
  f.sequence(:name) {|n| "Venue #{n}" }
  f.address { Faker::Address.street_address }
end
