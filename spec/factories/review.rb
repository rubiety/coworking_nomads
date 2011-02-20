Factory.define :review do |f|
  f.association :venue
  f.association :user
  f.active true
  f.rating { (1..10).to_a.sample }
  f.wifi_rating { (1..10).to_a.sample }
  f.wifi_notes { Faker::Lorem.words.join(" ") }
  f.ambiance_rating { (1..10).to_a.sample }
  f.ambiance_notes { Faker::Lorem.words.join(" ") }
  f.table_availability_rating { (1..10).to_a.sample }
  f.table_availability_notes { Faker::Lorem.words.join(" ") }
  f.notes { Faker::Lorem.paragraph }
end

Factory.define :deactivated_review, :parent => :review do |f|
  f.active false
end
