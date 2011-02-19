@wip
Feature: Browsing Venues
  
  Scenario: Listing All Venues
    Given a venue exists with city: "San Diego"
    And another venue exists with city: "San Diego"
    When I go to the city page for "San Diego"
    And I follow "See All Venues" within the venues list
    Then I should see 2 cities in the venues list
  
  Scenario: Viewing a Venue
    Given a venue exists with city: "San Diego"
    And I go to the city "San Diego"'s that venue page
    Then I should see the venue's basic information
    And I should see the venue's main photo
    And I should see the venue's reviews
    And I should see the venue's recent checkins
  
  