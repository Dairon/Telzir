class TelzirController < ApplicationController
    def index
        phone_plans = PhonePlan.order(free_time: :asc)
        @plans = []
        phone_plans.each do |plan|
            @plans.append([plan.name])
        end
    end

    def result
    end
end
