Feature: Managing Venues
  Background:
    Given I am logged in as an administrator
  
  Scenario: Creating a Venue
    Given I go to the city page
    And I follow "See All Venues"
    And I follow "Create Venue" within the venues list
    And I fill in "Name" with "Filter Coffee"
    And I press "Create Venue"
    Then I should see "successfully" within the flash messages
    And a venue should exist with city: city "San Diego", name: "Filter Coffee"
    And that venue should not be active
    And I should be on the city's venue page
  
  Scenario: Updating a Venue
    Given a venue exists with city: the city
    When I go to the city's venue page
    And I follow "Edit" within the venue admin links
    And I fill in "Name" with "New Name"
    And I press "Save Changes"
    Then I should see "successfully" within the flash messages
    And a venue should exist with city: that city, name: "New Name"
    And I should be on the city's venue page

  Scenario: Adding a Venue Photo
    Given a venue exists with city: the city
    When I go to the city's venue page
    And I follow "Edit" within the venue admin links
    And I attach the file "spec/support/files/venue_photo.jpg" to "Image"
    And I press "Save Changes"
    Then I should see "successfully" within the flash messages
    And a venue photo should exist with venue: that venue
  
  Scenario: Activating a Venue
    Given a deactivated venue exists with city: the city
    When I go to the city's venue page
    And I follow "Activate" within the venue admin links
    Then I should see "successfully" within the flash messages
    And that deactivated venue should be active
    And I should be on the city's venue page
  
  Scenario: Deactivating a Venue
    Given a venue exists with city: the city
    And I go to the city's venue page
    And I follow "Deactivate" within the venue admin links
    Then I should see "successfully" within the flash messages
    And that venue should not be active
    And I should be on the city's venue page
  
  Scenario: Deleting a Venue
    Given a venue exists with city: the city
    And I go to the city's venue page
    And I follow "Delete" within the venue admin links
    Then I should see "successfully" within the flash messages
    And that venue should not exist
    And I should be on the city's venues page
  
