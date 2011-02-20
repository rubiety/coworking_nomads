Feature: Suggesting Cities
  
  Scenario: Suggesting a City
    When I go to the home page
    And I follow "Suggest a City" within the cities list
    And I fill in "Your Name" with "Ben Hughes"
    And I fill in "Your Email" with "me@bjh.me"
    And I fill in "City Name" with "Williamsport, PA"
    And I press "Submit"
    Then a city suggestion should exist with name: "Williamsport, PA"
    And I should see "successfully" within the flash messages
    And I should be on the home page
  
