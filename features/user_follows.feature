@wip
Feature: User Follows
  Background:
    Given a user: "One" exists with city: "San Diego"
    And a user: "Two" exists with city: "San Diego"
    And I am logged in as user "One"
  
  Scenario: Following a User
    When I go to the city "San Diego"'s user "Two" page
    And I follow "Follow"
    Then I should see "Successful" in the flash messages
    And a follow should exist with user: user "One", followed_user: user "Two"
  
  Scenario: Unfollowing a User
    Given a follow exists with user: user "One", followed_user: user "Two"
    When I go to the city "San Diego"'s user "Two" page
    And I follow "Unfollow"
    Then I should see "Successful" in the flash messages
    And a follow should not exist with user: user: "One", followed_user: user "Two"
  