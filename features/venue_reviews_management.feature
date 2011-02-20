@wip
Feature: Managing Venue Reviews
  Background:
    Given I am logged in as an administrator
    And a venue exists with city: "San Diego"
  
  Scenario: Showing Venue Reviews
    When I go to the city "San Diego"'s that venue page
    And I follow "Manage Reviews" in the venue admin links
  
  Scenario: Editing a Venue Review
  
  Scenario: Deleting a Venue Review
  
  
