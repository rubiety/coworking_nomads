@wip
Feature: Browsing Cities
  
  Scenario: Viewing Home Page
    Given I go to the home page
    Then I should see 2 cities within the cities list
    And I should see "sign up" within the header links
    And I should see "sign in" within the header links
  
  Scenario: Viewing a City
    Given 3 venues exist with city: city "San Diego"
    When I go to the city page
    Then I should see 3 venues within the venues list
    And I should see "Trending Now" within the venues list
    And I should see "Near Me" within the venues list
    And I should see "Highest Rated" within the venues list
    And I should see a map with checkins
  
