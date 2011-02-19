@wip
Feature: Managing Cities
  Background:
    Given I am logged in as an administrator
  
  Scenario: Showing the City Dashboard
    When I go to the city page for "San Diego"
    And I follow "Dashboard" in the city admin links
  
  Scenario: Creating a City
    When I go to the home page
    And I follow "Create City" within the cities list
    And I fill in "Name" with "Williamsport"
    And I press "Create City"
    Then I should see "Successful" in the flash messages
    And a city should exist with name: "Williamsport"
    And that city should not be active
  
  Scenario: Updating a City
    When I go to the city page for "San Diego"
    And I follow "Edit" in the city admin links
    And I fill in "Name" with "New Name"
    And I press "Save Changes"
    Then I should see "Successful" in the flash messages
    And a city should exist with name: "New Name"
    And I should be on the page for that city
  
  Scenario: Activating a City
    Given a deactivated city exists
    When I go to the city page for that deactivated city
    And I follow "Activate" in the city admin links
    Then I should see "Successful" in the flash messages
    And the deactivated city should be active
    And I should be on the page for that city
  
  Scenario: Deactivating a City
    Given a city exists
    When I go to the city page for that city
    And I follow "Deactivate" in the city admin links
    Then I should see "Successful" in the flash messages
    And the city should not be active
    And I should be on the page for that city
  
  Scenario: Deleting a City
    When I go to the city page for "San Diego"
    And I follow "Delete" in the city admin links
    Then I should see "Successful" in the flash messages
    And that city should not exist
    And I should be on the home page
  
  