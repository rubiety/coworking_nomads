@wip
Feature: User Account Management
  Background:
    Given a user exists with city: "San Diego"
    And I am logged in as that user
  
  Scenario: Editing Profile Details
    When I go to the city "San Diego"'s that user page
    And I follow "Edit Profile" within the user navigation
    And I fill in "First Name" with "New"
    And I fill in "Last Name" with "Name"
    And I fill in "Biography" with "My new biography here."
    And I attach a file at "user_profile_photo.jpg" to "Photo"
    And I fill in "Website" with "http://benhughes.name"
    And I fill in "Twitter" with "coworkingnomads"
    And I fill in "Linked In" with "coworkingnomads"
    And I press "Save Profile"
    Then I should see "Successful" in the flash messages
    And a user should exist with first_name: "New", last_name: "Name"
    And I should be on the city "San Diego"'s that user page
  
  Scenario: Changing My Password
    When I go to the city "San Diego"'s that user page
    And I follow "Change Profile" within the user navigation
    And I fill in "New Password" with "newpassword"
    And I fill in "Change Password" with "newpassword"
    And I press "Change Password"
    Then I should see "Successful" in the flash messages
    And I should be on the city "San Diego"'s that user page
  
  Scenario: Changing My City
    When I go to the city "San Diego"'s that user page
    And I follow "Change City" within the user navigation
    And I select "Rochester" from "City"
    And I press "Change City"
    Then I should see "Successful" in the flash messages
    And that user's city should be city "Rochester"
    And I should be on the city "San Diego"'s that user page
  
  Scenario: Changing My Privacy Settings
    When I go to the city "San Diego"'s that user page
    And I follow "Privacy Settings" within the user navigation
  
  Scenario: Deleting My Account
    When I go to the city "San Diego"'s that user page
    And I follow "Delete Account" within the user registration
    And I check "Confirm Deletion"
    And I press "Delete Account"
    Then I should see "Successful" in the flash messages
    And I should be on the home page