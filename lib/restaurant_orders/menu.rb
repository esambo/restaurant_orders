module RestaurantOrders
  class Menu

    def initialize(dishes)
      @dishes = dishes
    end

    def get_combinations(target_price)
      total = 0
      d = @dishes.map { |dish|
        name  = dish[0]
        price = dish[1]
        if total + price <= target_price
          total += price
          name
        else
          nil
        end
      }
      total == target_price ? d.compact : []
    end

  end
end
