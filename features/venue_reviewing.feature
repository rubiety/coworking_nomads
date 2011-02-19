@wip
Feature: Reviewing Venues
  Background:
    Given a user exists with city: "San Diego"
    And a venue exists with city: "San Diego"
    And I am logged in as that user
  
  Scenario: Creating a Venue Review
    When I go to the city "San Diego"'s that venue page
    And I follow "Create Review" in the reviews list
    And I fill in "Content" with "This place is great!"
    And I fill in "Stars" with "5"
    And I press "Submit Review"
    Then I should see "Successful" in the flash messages
    And a review should exist for city: "San Diego", venue: that venue
    And I should be on the city: "San Diego"'s venue review confirmation page
  