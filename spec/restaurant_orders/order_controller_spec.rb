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
    let(:menu)       { double :Menu }
    before :each do
      controller.menu_source = ->{ menu }
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

  end
end
