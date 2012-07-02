module RestaurantOrders
  class Menu

    def initialize(dishes)
      @dishes = dishes
    end

    def get_combinations(target_price)
      c = []
      @dishes.permutation.each { |dishes|
        d = combination(dishes, target_price)
        c << d if d
      }
      c.map(&:sort).uniq.flatten
    end

    private

      def combination(dishes, target_price)
        total = 0
        names = []
        dishes.each { |dish|
          name  = dish[0]
          price = dish[1]
          if total + price <= target_price
            total += price
            names << name
          end
        }
        names if total == target_price
      end

  end
end
