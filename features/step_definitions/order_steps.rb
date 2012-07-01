Given /^a menu that adds up nicely$/ do
  @target_price    = 15.05
  @menu = RestaurantOrders::Menu.new({
    'mixed fruit'  => 2.15,
    'french fries' => 2.75
  })
end

When /^when I get the combinations$/ do
  @orders = @menu.get_combinations(@target_price)
end

Then /^it should show me the dishes$/ do
  @orders.should == [
    'mixed fruit',
    'french fries'
  ]
end
