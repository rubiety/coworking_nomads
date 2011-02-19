@wip
Feature: User Browsing
  Background:
    Given a user: "One" exists with city: "San Diego", first_name: "User", last_name: "One"
    Given a user: "Two" exists with city: "San Diego", first_name: "User", last_name: "Two", biography: "Web Developer"
    Given a user: "Three" exists with city: "San Diego", first_name: "User", last_name: "Three"
  
  Scenario: Listing All Users
    When I go to the city page for "San Diego"
    And I follow "See All Users"
    Then I should see 3 users within the users list
  
  Scenario: Searching for Users by Name
    When I go to the city page for "San Diego"
    And I follow "See All Users"
    And I fill in "Query" with "User One"
    Then I should see 1 user within the users list
  
  Scenario: Searching for Users by Biography
    When I go to the city page for San Diego
    And I follow "See All Users"
    And I fill in "Query" with "Web Developer"
    Then I should see 1 user within the users list
  
  Scenario: Viewing a User's Profile
    When I go to the city "San Diego"'s user "One"'s page
    Then I should see the user's basic information
    And I should see the user's biography
    And I should see the user's profile picture
    And I should see the user's recent checkins
    And I should see the user's reviews
  