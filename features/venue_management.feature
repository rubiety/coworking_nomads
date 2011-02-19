@wip
Feature: Managing Venues
  Background:
    Given I am logged in as an administrator
  
  Scenario: Creating a Venue
    Given I go to the city page for "San Diego"
    And I follow "See All Venues"
    And I follow "Create Venue" within the venues list
    And I fill in "Name" with "Filter Coffee"
    And I press "Create Venue"
    Then I should see "Successful" in the flash messages
    And a venue should exist with city: "San Diego", name: "Filter Coffee"
    And that venue should not be active
  
  Scenario: Updating a Venue
    Given a venue exists with city: "San Diego"
    When I go to the city "San Diego"'s that venue page
    And I follow "Edit" in the venue admin links
    And I fill in "Name" with "New Name"
    And I press "Save Changes"
    Then I should see "Successful" in the flash messages
    And a venue should exist with name: "New Name"
  
  Scenario: Activating a Venue
    Given a deactivated venue exists with city: "San Diego"
    When I go to the city "San Diego"'s that venue page
    And I follow "Activate" in the venue admin links
    Then I should see "Successful" in the flash messages
    And that deactivated venue should be active
  
  Scenario: Deactivating a Venue
    Given a venue exists with city: "San Diego"
    And I go to the city "San Diego"'s that venue page
    And I follow "Deactivate" in the venue admin links
    Then I should see "Successful" in the flash messages
    And that venue should not be active
  
  Scenario: Deleting a Venue
    Given a venue exists with city: "San Diego"
    And I go to the city "San Diego"'s that venue page
    And I follow "Delete" in the venue admin links
    Then I should see "Successful" in the flash messages
    And that venue should not exist
    And I should be on the city page for "San Diego"
  