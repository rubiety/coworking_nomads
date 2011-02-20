Feature: Managing Cities
  Background:
    Given I am logged in as an administrator
  
  Scenario: Showing the City Dashboard
    When I go to the city's page
    And I follow "Dashboard" within the city admin links
  
  Scenario: Creating a City
    When I go to the cities page
    And I follow "Create City"
    And I fill in "Name" with "Williamsport"
    And I press "Create City"
    Then I should see "successfully" within the flash messages
    And a city should exist with name: "Williamsport"
    And that city should not be active
    And I should be on the city's page
  
  Scenario: Updating a City
    Given a city exists
    When I go to the city's page
    And I follow "Edit" within the city admin links
    And I fill in "Name" with "New Name"
    And I press "Save Changes"
    Then I should see "successfully" within the flash messages
    And a city should exist with name: "New Name"
    And I should be on the city's page
  
  Scenario: Activating a City
    Given a deactivated city exists
    When I go to the deactivated city's page
    And I follow "Activate" within the city admin links
    Then I should see "successfully" within the flash messages
    And the deactivated city should be active
    And I should be on the city's page
  
  Scenario: Deactivating a City
    Given a city exists
    When I go to the city's page
    And I follow "Deactivate" within the city admin links
    Then I should see "successfully" within the flash messages
    And the city should not be active
    And I should be on the city's page
  
  Scenario: Deleting a City
    Given a city exists
    When I go to the city's page
    And I follow "Delete" within the city admin links
    Then I should see "successfully" within the flash messages
    And I should be on the cities page
  
  
