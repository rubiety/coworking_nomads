Factory.define :venue do |f|
  f.association :city
  f.sequence(:name) {|n| "Venue #{n}" }
  f.active true
end

Factory.define :deactivated_venue, :parent => :venue do |f|
  f.active false
end
