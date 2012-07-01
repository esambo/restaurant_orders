require 'spec_helper'
require 'restaurant_orders/menu'

module RestaurantOrders
  describe Menu do

    describe '#get_combinations' do
      context 'with dishes that add up to the target price' do
        let(:target_price) {  5.00 }
        let(:menu) {
          Menu.new({
            'mixed fruit'  => 2.15,
            'french fries' => 2.75
          })
        }
        it 'shows the dishes' do
          menu.get_combinations(target_price).should == [
            'mixed fruit',
            'french fries'
          ]
        end
      end
    end

  end
end
