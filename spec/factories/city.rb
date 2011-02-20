Factory.define :city do |f|
  f.sequence(:name) {|n| "City #{n}" }
  f.active true
end

Factory.define :deactivated_city, :parent => :city do |f|
  f.active false
end