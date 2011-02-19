@wip
Feature: Browsing Cities
  
  Scenario: Viewing Home Page
    Given I go to the home page
    Then I should see 2 cities within the cities list
    And I should see "Get Started Now"
    And I should see "sign up" within the header links
    And I should see "log in" within the header links
    And I should see "log in with facebook" within the header links
    And I should see contact information within the footer
  
  Scenario: Viewing a City
    Given three venues exist for the city "San Diego"
    When I go to the city page for city "San Diego"
    Then I should see "Trending Now" within the venues list
    And I should see "Near Me" within the venues list
    And I should see "Highest Rated" within the venues list
    And I should see a map with checkins
  