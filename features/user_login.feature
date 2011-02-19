@wip
Feature: User Login
  
  Scenario: Logging in through the Application
    Given a user exists with city: city "San Diego", email: "me@bjh.me"
    When I go to the home page
    And I follow "sign in" in the header links
    And I fill in "Email" with "me@bjh.me"
    And I fill in "Password" with "password"
    And I press "Sign In"
    Then I should see "Successfully Authorized" in the flash messages
    And I should be on the city page for "San Diego"
  
  Scenario: Logging in through Facebook
    Given a user with facebook exists with city: city "San Diego"
    When I go to the home page
    And I follow "log in with facebook" in the header links
    Then I should "Successfully Authorized" in the flash messages
    And I should be on the city page for "San Diego"
  
  Scenario: Logging in through Foursquare
    Given a user with foursquare exists with city: city "San Diego"
    When I go to the home page
    And I follow "log in with facebook" in the header links
    Then I should "Successfully Authorized" in the flash messages
    And I should be on the city page for "San Diego"
  