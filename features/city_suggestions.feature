@wip
Feature: Suggesting Cities
  
  Scenario: Suggesting a City
    When I go to the home page
    And I follow "Suggest a City" within the cities list
    And I fill in "Name" with "Ben Hughes"
    And I fill in "Email" with "me@bjh.me"
    And I fill in "City" with "Williamsport, PA"
    And I check "City Manager"
    And I press "Submit"
    Then a city suggestion should exist with city: "Williamsport, PA"
    And I should see "Thank You"
    And I should be on the city suggestions confirmation page
  