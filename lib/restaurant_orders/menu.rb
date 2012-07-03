module RestaurantOrders
  class Menu

    def initialize(dishes)
      @dishes = dishes
    end

    def get_combinations(target_price)
      c = []
      dish_perms = @dishes.permutation
      dups_until(dish_perms, target_price).each do |dishes|
        d = select_until(dishes, target_price)
        c << d if d
      end
      c.map(&:sort).uniq.flatten
    end

    private

      def dups_until(dish_perms, target_price)
        dish_perms.map { |dishes|
          dups = []
          dishes.each do |d|
            price = d[1]
            (target_price / price).floor.times do |_|
              dups << d
            end
          end
          dups
        }
      end

      def select_until(dishes, target_price)
        total = 0
        names = []
        dishes.each do |dish|
          name  = dish[0]
          price = dish[1]
          if total + price <= target_price
            total += price
            names << name
          end
        end
        names if total == target_price
      end

  end
end
