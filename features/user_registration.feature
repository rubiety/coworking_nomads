@wip
Feature: User Registration
  
  Scenario: Registering with the Application
    When I go to the home page
    And I follow "sign up" within the header links
    And I fill in "Email" with "me@bjh.me"
    And I fill in "First Name" with "Ben"
    And I fill in "Last Name" with "Hughes"
    And I select "San Diego" from "City"
    Then I should see "Successful" in the flash messages
    And a user should exist with city: "San Diego", email: "me@bjh.me"
    And I should be on the city "San Diego"'s that user's edit page
  
  @javascript
  Scenario: Registering with the Application with a New City
    When I go to the home page
    And I follow "sign up" within the header links
    And I fill in "Email" with "me@bjh.me"
    And I fill in "First Name" with "Ben"
    And I fill in "Last Name" with "Hughes"
    And I select "Another City..." from "City"
    And I fill in "Your City" with "Williamsport"
    And I fill in "Your State" with "PA"
    And I fill check "City Manager"
    And I press "Sign Up"
    Then I should see "Successful" in the flash messages
    And a user should exist with city: "San Diego", email: "me@bjh.me"
    And I should be on the city "San Diego"'s that user's edit page
  
  Scenario: Registering via Facebook
    When I go to the home page
    And I follow "log in with facebook" in the header links
    Then I should "Successfully Authorized" in the flash messages
    And I should be on the complete facebook registration page
  
  Scenario: Registering via Foursquare
    When I go to the home page
    And I follow "log in with foursquare" in the header links
    Then I should "Successfully Authorized" in the flash messages
    And I should be on the complete foursquare registration page