Then /^I should see ([0-9]+) cities/ do |count|
  page.should have_css("section#cities ul li", :count => count.to_i)
end