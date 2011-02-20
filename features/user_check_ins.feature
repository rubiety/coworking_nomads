Feature: User Checkins
  Background:
    Given a venue exists with city: the city
    And a user exists with city: the city
  
  Scenario: Checking In via the Web
    When I am logged in
    And I go to the city's venue page
    And I follow "Check In"
    And I fill in "Notes" with "Great day for coworking!"
    And I press "Check In Now"
    Then a check in should exist with user: that user, venue: that venue
    And I should see "successfully" within the flash messages
  
  @wip
  Scenario: Checking In via Foursquare
  
  @wip
  Scenario: Checking In via Gowalla
  
  @wip
  Scenario: Checking In via Facebook
  
