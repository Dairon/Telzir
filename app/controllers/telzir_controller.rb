class TelzirController < ApplicationController
    def index
        phone_plans = PhonePlan.order(free_time: :asc)
        @plans = []
        phone_plans.each do |plan|
            @plans.append([plan.name])
        end
    end

    def result
        @origin = params["origin"]
        @destination = params["destination"]
        @time = params["time"].to_i
        @plan = params["plan"]
        origin_destination_fare = DataBaseRetrieval.new.search_fare(@origin, @destination)
        phoneplan = DataBaseRetrieval.new.search_plan(@plan)
        telzir_tariff_calculator = TelzirTariffCalculator.new(origin_destination_fare, phoneplan, @time)
        @cost_with_plan = telzir_tariff_calculator.cost_with_plan
        @cos_without_plan = telzir_tariff_calculator.cost_without_plan
    end
end
