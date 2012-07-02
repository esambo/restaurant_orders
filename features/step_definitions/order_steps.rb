Given /^a menu that sums up to the target price$/ do
  @target_price    = 4.90
  @menu = RestaurantOrders::Menu.new([
    ['mixed fruit',  2.15],
    ['french fries', 2.75]
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
  @orders.should == [
    'mixed fruit',
    'french fries'
  ]
end

Then /^it should show me that nothing was found$/ do
  @orders.should == []
end
