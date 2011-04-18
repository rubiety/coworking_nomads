Then /^I should see ([0-9]+) venues$/ do |count|
  page.should have_css("article", :count => count.to_i)
end
