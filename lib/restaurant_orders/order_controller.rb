module RestaurantOrders
  class OrderController
    attr_writer :menu_source
    attr_reader :menu

    def initialize(input, output)
      @input, @output = input, output
    end

    def call

    end

    def parse
      @input.each_line.map { |c|
          c.chomp.split(',').tap { |e|
            # e[0]  = e[0].downcase
            e[-1] = e[-1].to_s[1..-1].to_f
            # e[2]  = e[2].to_i
          }
        }
    end

  end
end
