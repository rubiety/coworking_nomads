Factory.define :city_suggestion do |f|
  f.sequence(:name) {|n| "City #{n}" }
  f.from_name { Faker::Name.name }
  f.from_email { Faker::Internet.email }
end
