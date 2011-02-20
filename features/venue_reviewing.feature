Feature: Reviewing Venues
  Background:
    Given I am logged in
    And a venue exists with city: the city
  
  Scenario: Creating a Venue Review
    When I go to the city's venue page
    And I follow "Create Review" within the reviews list
    And I fill in the following:
      | Notes                     | This place is great!  |
      | Rating                    | 10                    |
      | Wifi Rating               | 10                    |
      | Wifi Notes                | Wifi is great!        |
      | Ambiance Rating           | 10                    |
      | Ambiance Notes            | Ambiance is great!    |
      | Table Availability Rating | 7                     |
      | Table Availability Notes  | Hard to find a table. |
      | Notes                     | Example notes here.   |
    And I press "Create Review"
    Then I should see "successfully" within the flash messages
    And a review should exist with venue: that venue
    And I should be on the city's venue page
  
