Given /^I am not authenticated$/ do
  visit('/user/sign_out')
end

Given /^I am logged in as an administrator$/ do
  user = find_model("admin") || Factory(:admin)

  Given %{I go to the home page}
  And %{I follow "sign in" within the header links}
  And %{I fill in "Email" with "#{user.email}"}
  And %{I fill in "Password" with "password"}
  And %{I press "Sign In"}
end

Given /^I am logged in$/ do
  user = find_model("user") || Factory(:user)

  Given %{I go to the home page}
  And %{I follow "sign in" within the header links}
  And %{I fill in "Email" with "#{user.email}"}
  And %{I fill in "Password" with "password"}
  And %{I press "Sign In"}
end

Given /^I am registered as and admin$/ do
  admin = find_model("user", name: 'admin') || Factory(:user, name: 'admin')
end
