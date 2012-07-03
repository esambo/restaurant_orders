require 'spec_helper'
require 'restaurant_orders/menu'

module RestaurantOrders
  describe Menu do
    let(:menu) { Menu.new(dishes) }

    describe '#get_combinations' do

      context 'with dishes that add up to the target price' do
        let(:target_price) { 4.90 }
        let(:dishes)       {[
            ['mixed fruit',  2.15],
            ['french fries', 2.75]
        ]}
        it 'shows all dishes' do
          menu.get_combinations(target_price).should == [
            'mixed fruit',
            'french fries'
          ].sort
        end
      end

      context 'with first two dishes adding up to the target price' do
        let(:target_price) { 4.90 }
        let(:dishes)       {[
            ['mixed fruit',  2.15],
            ['french fries', 2.75],
            ['side salad',   3.35]
        ]}
        it 'shows only the first two dishes' do
          menu.get_combinations(target_price).should == [
            'mixed fruit',
            'french fries'
          ].sort
        end
      end

      context 'with no dishes adding up to the target price' do
        let(:target_price) { 3.00 }
        let(:dishes)       {[
            ['mixed fruit',  2.15],
            ['french fries', 2.75]
        ]}
        it 'shows only the first two dishes' do
          menu.get_combinations(target_price).should == []
        end
      end

      context 'with last two dishes adding up to the target price' do
        let(:target_price) { 6.10 }
        let(:dishes)       {[
            ['mixed fruit',  2.15],
            ['french fries', 2.75],
            ['side salad',   3.35]
        ]}
        it 'excludes the first dish' do
          menu.get_combinations(target_price).should == [
            'french fries',
            'side salad'
          ].sort
        end
      end

      context 'with two of the first dish adding up to the target price' do
        let(:target_price) { 4.30 }
        let(:dishes)       {[
            ['mixed fruit',  2.15]
        ]}
        it 'includes the first dish twice' do
          menu.get_combinations(target_price).should == [
            'mixed fruit',
            'mixed fruit'
          ].sort
        end
      end

    end

    describe '(private) #dups_until' do
      context 'with 3 different dishes' do
        let(:dishes)       {[
            ['a',  1],
            ['b',  3],
            ['c',  5]
        ]}
        let(:dish_perms)   {[
          dishes,
          [['d', 3.5]]
        ]}
        let(:target_price) { 7 }
        it 'duplicates until target price' do
          menu.send(:dups_until, dish_perms, target_price).to_a.should == [
            [ ['a', 1], ['a', 1], ['a', 1], ['a', 1], ['a', 1], ['a', 1], ['a', 1],
              ['b', 3], ['b', 3],
              ['c', 5]
            ],
            [ ['d', 3.5], ['d', 3.5]
            ]
          ]
        end
      end
    end

  end
end
