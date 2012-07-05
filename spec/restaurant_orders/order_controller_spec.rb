require 'spec_helper'
require 'restaurant_orders/order_controller'

module Heredoc
  def unindent
    gsub(/^#{self[/\A\s*/]}/, '')
  end
end

module RestaurantOrders
  describe OrderController do
    let(:input)      { double :Input }
    let(:output)     { double :Output }
    let(:controller) { OrderController.new(input, output) }
    let(:menu)       { double(:Menu).as_null_object }
    before :each do
      controller.menu_source = ->(d){ menu }
    end

    describe '#parse' do
      context 'with target price and dishes' do
        let(:input) {
          <<-EOS.extend(Heredoc).unindent
            $15.05
            mixed fruit,$2.15
            french fries,$2.75
            side salad,$3.35
            hot wings,$3.55
            mozzarella sticks,$4.20
            sampler plate,$5.80'
          EOS
        }
        it 'splits and converts the input' do
          controller.parse.should == [
            [                    15.05],
            ['mixed fruit',       2.15],
            ['french fries',      2.75],
            ['side salad',        3.35],
            ['hot wings',         3.55],
            ['mozzarella sticks', 4.20],
            ['sampler plate',     5.80]
          ]
        end
      end
    end

    describe '#process' do
      context 'with parsed input' do
        let(:target_price) { 4.90 }
        before :each do
          controller.stub(:parse) {[
            [target_price],
            ['mixed fruit',  2.15],
            ['french fries', 2.75]
          ]}
        end
        it 'sends message #get_combinations with target price' do
          menu.should_receive(:get_combinations).with(target_price)
          controller.process
        end
      end
    end

  end
end
