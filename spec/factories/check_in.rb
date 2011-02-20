Factory.define :check_in do |f|
  f.association :venue
  f.association :user
  f.notes { Faker::Lorem.words.join(" ") }
end
