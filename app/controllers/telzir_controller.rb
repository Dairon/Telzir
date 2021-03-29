require 'data_base_retrieval'


class TelzirController < ApplicationController
    @@data_base_retrieval = DataBaseRetrieval.new
    
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
        origin_destination_fare = @@data_base_retrieval.search_fare(@origin, @destination)
        phoneplan = @@data_base_retrieval.search_plan(@plan)
        telzir_tariff_calculator = TariffCalculator.new(origin_destination_fare, phoneplan, @time)
        @cost_with_plan = telzir_tariff_calculator.cost_with_plan
        @cos_without_plan = telzir_tariff_calculator.cost_without_plan
    end
end
