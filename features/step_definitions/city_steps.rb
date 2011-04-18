Then /^I should see ([0-9]+) cities$/ do |count|
  page.should have_css("ul li.city", :count => count.to_i)
end

Then /^I should see a map$/ do
  page.should have_css("section#map")
end
