Feature: Suggesting Venues
  Background:
    Given I am logged in
  
  Scenario: Suggesting a Venue
    When I go to the city page
    And I follow "Suggest a Venue" within the venues list
    And I fill in "Name" with "Filter Coffee"
    And I fill in "Address" with "123 30th Street, San Diego, CA"
    And I press "Submit"
    Then a venue suggestion should exist with city: the city
    And I should see "successfully"
    And I should be on the city page
  
