module RestaurantOrders
  class Menu

    def initialize(dishes)
      @dishes = dishes
    end

    def get_combinations(target_price)
      total = 0
      d = @dishes.select { |name, price|
        if total + price <= target_price
          total += price
          true
        else
          false
        end
      }
      total == target_price ? d.keys : []
    end

  end
end
