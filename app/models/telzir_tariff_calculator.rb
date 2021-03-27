class TelzirTariffCalculator
    def initialize(origin_destination_fare, phoneplan, time)
        @origin_destination_fare = origin_destination_fare
        @free_time = phoneplan.free_time
        @time = time
        @percentage_of_increase_beyond_plan_limit = 1.1
        @cost_with_plan = cost_of_time_with_plan
        @cost_without_plan = cost_of_time_without_plan
    end

    def cost_with_plan
        @cost_with_plan
    end

    def cost_without_plan
        @cost_without_plan
    end

    def cost_of_time_with_plan
        if @origin_destination_fare.nil?
            cost = "-"
        else
            cost = increase_on_fare_with_plan * total_call_tima_with_plan
            format_cost(cost)
        end
    end

    def increase_on_fare_with_plan
        fare = @origin_destination_fare.fare * @percentage_of_increase_beyond_plan_limit
    end
    
    def total_call_tima_with_plan
        total_time = @time - @free_time
        if total_time <= 0
            total_time = 0
        else
            total_time
        end
    end

    def cost_of_time_without_plan
        if @origin_destination_fare.nil?
            cost = "-"
        else
            cost = (@origin_destination_fare.fare) * @time
            format_cost(cost)
        end
    end
    
    def format_cost(cost)
        cost = ApplicationController.helpers.number_with_precision(cost, precision: 2)
        cost = "$ "+ cost
    end
end