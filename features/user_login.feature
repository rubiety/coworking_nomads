Feature: User Login
  
  Scenario: Logging in through the Application
    Given a user exists with email: "me@bjh.me"
    When I go to the home page
    And I follow "sign in" within the header links
    And I fill in "Email" with "me@bjh.me"
    And I fill in "Password" with "password"
    And I press "Sign In"
    Then I should see "successfully" within the flash messages
    # And I should be on the city page for "San Diego"
  
  @wip
  Scenario: Logging in through Facebook
    Given a user with facebook exists with city: city "San Diego"
    When I go to the home page
    And I follow "log in with facebook" within the header links
    Then I should "successfully" within the flash messages
    And I should be on the city page for "San Diego"
  
  @wip
  Scenario: Logging in through Foursquare
    Given a user with foursquare exists with city: city "San Diego"
    When I go to the home page
    And I follow "log in with facebook" in the header links
    Then I should "successfully" within the flash messages
    And I should be on the city page for "San Diego"
  
