module RestaurantOrders
  class OrderController
    attr_writer :menu_source
    attr_reader :menu

    def initialize(input, output)
      @input, @output = input, output
    end

    def call
      options = process
      render(options)
    end

      def process
        parsed       = parse
        target_price = parsed.shift.pop
        dishes       = parsed
        @menu        = new_menu(dishes)
        @menu.get_combinations(target_price)
      end

      def render(options)
        if options.count == 0
          @output.puts "No combination of dishes!"
        else
          options.each do |o|
            @output.puts o.join(', ')
          end
        end
      end

        def new_menu(dishes)
          menu_source.call(dishes)
        end

          def menu_source
            @menu_source ||= Menu.public_method :new
          end

        def parse
          @input.each_line.map { |c|
            c.chomp.split(',').tap { |e|
              e[-1] = e[-1].to_s[1..-1].to_f
            }
          }
        end

  end
end
