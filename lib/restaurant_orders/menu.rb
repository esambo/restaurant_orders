module RestaurantOrders
  class Menu

    def initialize(dishes)
      @dishes = dishes
    end

    def get_combinations(target_price)
      c                = []
      min_price        = @dishes.min { |d| d.last }.last
      combination_size = (target_price / min_price).floor
      @dishes.permutation.to_a.map { |dp|
        dp.repeated_combination(combination_size) do |dpr|
          dprs = select_until(dpr, target_price)
          c << dprs if dprs
        end
      }
      c.uniq.map(&:sort).uniq
    end

    private

      def select_until(dishes, target_price)
        total = 0
        names = []
        dishes.each do |dish|
          name  = dish.first
          price = dish.last
          if total + price <= target_price
            total += price
            names << name
          end
        end
        names if total == target_price
      end

  end
end
