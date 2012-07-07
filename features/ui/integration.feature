Feature: Integration test
  In order to order an exact amount worth of appetizers
  As a restaurant guest
  I want to see the walk through of a complete program

  @slow
  Scenario: via a file passed on the command line
    Given I run `bin/restaurant_orders data_files/menu.txt`
    Then the stdout should contain exactly:
      """
      mixed fruit, mixed fruit, mixed fruit, mixed fruit, mixed fruit, mixed fruit, mixed fruit
      hot wings, hot wings, mixed fruit, sampler plate

      """

  @slow
  Scenario: via stdin
    Given I run `bin/restaurant_orders '$15.05\nmixed fruit,$2.15\nfrench fries,$2.75\nside salad,$3.35\nhot wings,$3.55\nmozzarella sticks,$4.20\nsampler plate,$5.80'`
    Then the stdout should contain exactly:
      """
      mixed fruit, mixed fruit, mixed fruit, mixed fruit, mixed fruit, mixed fruit, mixed fruit
      hot wings, hot wings, mixed fruit, sampler plate
      
      """

  Scenario: via stdin and no combinations
    Given I run `bin/restaurant_orders '$1.05\nmixed fruit,$2.15\nfrench fries,$2.75'`
    Then the stdout should contain exactly:
      """
      No combination of dishes!

      """
