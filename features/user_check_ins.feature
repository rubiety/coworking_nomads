@wip
Feature: User Checkins
  Background:
    Given a venue exists with city: "San Diego"
    And a user exists with city: "San Diego"
  
  @javascript
  Scenario: Checking In via the Web
    When I am logged in as that user
    And I go to the city "San Diego"'s that venue page
    And I follow "Check In Here"
    And I fill in "Comment" with "Great day for coworking!"
    And I press "Check In Now"
    Then a check in should exist with user: that user, venue: that venue
    And I should see "Successful" in the flash messages
  
  Scenario: Checking In via Foursquare
  
  Scenario: Checking In via Gowalla
  
  Scenario: Checking In via Facebook
  