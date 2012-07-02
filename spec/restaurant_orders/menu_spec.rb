require 'spec_helper'
require 'restaurant_orders/menu'

module RestaurantOrders
  describe Menu do
    describe '#get_combinations' do

      context 'with dishes that add up to the target price' do
        let(:target_price) {  4.90 }
        let(:menu) {
          Menu.new({
            'mixed fruit'  => 2.15,
            'french fries' => 2.75
          })
        }
        it 'shows all dishes' do
          menu.get_combinations(target_price).should == [
            'mixed fruit',
            'french fries'
          ]
        end
      end

      context 'with first two dishes adding up to the target price' do
        let(:target_price) { 4.90 }
        let(:menu) {
          Menu.new({
            'mixed fruit'  => 2.15,
            'french fries' => 2.75,
            'side salad'   => 3.35
          })
        }
        it 'shows only the first two dishes' do
          menu.get_combinations(target_price).should == [
            'mixed fruit',
            'french fries'
          ]
        end
      end

      context 'with no dishes adding up to the target price' do
        let(:target_price) { 3.00 }
        let(:menu) {
          Menu.new({
            'mixed fruit'  => 2.15,
            'french fries' => 2.75
          })
        }
        it 'shows only the first two dishes' do
          menu.get_combinations(target_price).should == []
        end
      end

    end
  end
end
