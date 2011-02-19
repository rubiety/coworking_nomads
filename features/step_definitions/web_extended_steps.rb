When /^I bypass the javascript dialog on the next step$/ do
  page.evaluate_script('window.confirm = function() { return true; }')
  page.evaluate_script('window.alert = function() { return true; }')
end

# Adds selector abstraction via support/selectors.rb
When /^(.*) within ([^:"]+)$/ do |step, scope|
  with_scope(selector_for(scope)) do
    When step
  end
end

# Multi-line version of above
When /^(.*) within ([^:"]+):$/ do |step, scope, table_or_string|
  with_scope(selector_for(scope)) do
    When "#{step}:", table_or_string
  end
end
