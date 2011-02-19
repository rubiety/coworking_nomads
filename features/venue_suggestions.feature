@wip
Feature: Suggesting Venues
  
  Scenario: Suggesting a Venue
    When I go to the city page for "San Diego"
    And I follow "Suggest a Venue" within the venues list
    And I fill in "Name" with "Filter Coffee"
    And I fill in "Address" with "123 30th Street, San Diego, CA"
    And I press "Submit"
    Then a venue suggestion should exist with city: "San Diego"
    And I should see "Thank You"
    And I should be on the venue suggestions confirmation page
  