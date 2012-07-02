Given /^a menu that sums up to the target price$/ do
  @target_price    = 4.90
  @menu = RestaurantOrders::Menu.new([
    ['mixed fruit',  2.15],
    ['french fries', 2.75]
  ])
end

Given /^a menu with target price combinations$/ do
  @target_price         = 15.05
  @menu = RestaurantOrders::Menu.new([
    ['mixed fruit',       2.15],
    ['french fries',      2.75],
    ['side salad',        3.35],
    ['hot wings',         3.55],
    ['mozzarella sticks', 4.20],
    ['sampler plate',     5.80]
  ])
end

Given /^a menu that does not add up$/ do
  @target_price    =  3.00
  @menu = RestaurantOrders::Menu.new([
    ['mixed fruit',   2.15],
    ['french fries',  2.75]
  ])
end

When /^when I get the combinations$/ do
  @orders = @menu.get_combinations(@target_price)
end

Then /^it should show me the options$/ do
  message = "expected: count > 0\n" +
            "     got: #{@orders}\n"
  @orders.count.should be > 0, message
end

Then /^it should show me that nothing was found$/ do
  message = "expected: count == 0\n" +
            "     got: #{@orders}\n"
  @orders.count.should eq(0), message
end
