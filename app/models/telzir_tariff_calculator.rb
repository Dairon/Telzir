class TelzirTariffCalculator
    def initialize(origin_destination_fare, phoneplan, time)
        @origin_destination_fare = origin_destination_fare
        @free_time = phoneplan.free_time
        @time = time
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
            cost = (@origin_destination_fare.fare * 1.1) * total_call_tima_with_plan
            cost.to_s
        end
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
            cost.to_s
        end
    end
end