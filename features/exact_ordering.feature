Feature: Exact Ordering
  In order to order an exact amount worth of appetizers
  As a restaurant guest
  I want to find any combination of dishes that add up exactly to the target price

  Scenario: add up exactly
    Given a menu that adds up nicely
    When when I get the combinations
    Then it should show me the dishes
