module RestaurantOrders
  class Menu

    def initialize(dishes)
      @dishes = dishes
    end

    def get_combinations(target_price)
      @dishes.keys
    end

  end
end
