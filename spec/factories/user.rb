Factory.define :user do |u|
  # u.association :city
  u.first_name { Faker::Name.first_name }
  u.last_name { Faker::Name.last_name }
  u.sequence(:email) {|n| "user#{n}@coworkingnomads.com" }
  u.password { "password" }
  u.password_confirmation { "password" }
  u.biography { Faker::Lorem.paragraphs.first }
  u.website { "http://" + Faker::Internet.domain_name }
  u.sequence(:twitter) {|n| "twitter_#{n}" }
  u.sequence(:linked_in) {|n| "linked_in_#{n}" }
  u.sequence(:github) {|n| "github_#{n}" }
end

Factory.define :admin, :parent => :user do |u|
  u.admin true
end
