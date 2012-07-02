Feature: Exact Ordering
  In order to order an exact amount worth of appetizers
  As a restaurant guest
  I want to find any combination of dishes that add up exactly to the target price

  Scenario: combination(s) exist
    Given a menu that adds up nicely
    When when I get the combinations
    Then it should show me the options

  Scenario: combinations do not exist
    Given a menu that does not add up nicely
    When when I get the combinations
    Then it should show me that nothing was found
