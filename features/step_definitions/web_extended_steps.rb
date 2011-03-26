When /^I select "([^"]*)" from my computer to upload it to "([^"]*)"$/ do |filename, name|
  When %(I attach the file "spec/support/files/#{filename}" to "#{name}")
end

When /^I bypass the javascript dialog on the next step$/ do
  page.evaluate_script('window.confirm = function() { return true; }')
  page.evaluate_script('window.alert = function() { return true; }')
end
