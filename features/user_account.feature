Feature: User Account Management
  Background:
    Given a user exists with city: the city
    And I am logged in
  
  Scenario: Editing Profile Details
    When I go to the user's page
    And I follow "Edit Profile" within the user navigation
    And I fill in "First Name" with "New"
    And I fill in "Last Name" with "Name"
    And I fill in "Biography" with "My new biography here."
    And I fill in "Website" with "http://benhughes.name"
    And I fill in "Twitter" with "coworkingnomads"
    And I fill in "Linked In" with "coworkingnomads"
    And I press "Save Profile"
    Then I should see "successful" within the flash messages
    And a user should exist with first_name: "New", last_name: "Name"
    And I should be on that user's page
  
  @wip
  Scenario: Uploadiing an Avatar
    When I go to the user's page
    And I follow "Edit Profile" within the user navigation
  
  Scenario: Changing My City
    When I go to the city's that user page
    And I follow "Change City" within the user navigation
    And I select "Rochester" from "City"
    And I press "Change City"
    Then I should see "successful" within the flash messages
    And the city: "Rochester" should be that user's city
    And I should be on that user's page
  
  Scenario: Changing My Privacy Settings
    When I go to the city's that user page
    And I follow "Privacy Settings" within the user navigation
  
  Scenario: Deleting My Account
    When I go to the city's that user page
    And I follow "Delete Account" within the user navigation
    And I check "confirm_deletion"
    And I press "Delete Account"
    Then I should see "successful" within the flash messages
    And I should be on the home page
