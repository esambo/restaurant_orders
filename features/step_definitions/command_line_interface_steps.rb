module PutString
  def puts(str)
    self << str
  end
end

def output
  @output ||= [].extend PutString
end

def validate_incrementally(find_in, find, index)
  index ||= 0
  failure_message = "expected: #{find}\n" +
                    "     got: #{find_in[index..-1]}\n" +
                    ">= index: #{index}\n" +
                    "      in: #{find_in}\n"
  find_in[index..-1].should include(find), failure_message
  i = find_in[index..-1].index(find)
  index += i + 1 unless i.nil?
  index
end


Given /^the input:$/ do |input|
  @input = input
end

When /^I start a program$/ do
  controller = RestaurantOrders::OrderController.new(@input, output)
  controller.call
  @menu = controller.menu
end

Then /^the summary should include "(.*?)"$/ do |output_line|
  output_items   = output_line.split(', ')
  output_items.each do |dish|
    @output_index = validate_incrementally(output, dish, @output_index)
  end
end
