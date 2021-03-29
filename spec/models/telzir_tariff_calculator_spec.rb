require 'rails_helper'

RSpec.describe TariffCalculator, type: :model do
    context "Validates if the cost is being correctly formated" do
        let(:origin_destination_fare) {
            OriginDestinationFare.new(origin: "011",destination: "016",fare: 1.90)
    }
        let(:phone_plan) {
            PhonePlan.new(name:"FaleMais 30",free_time: 30)
    }
        it "is correct for integer" do
            telzir_tariff_calculator = TariffCalculator.new(origin_destination_fare, phone_plan, 20)
            cost = telzir_tariff_calculator.format_cost(20)
            expect(cost).to eq("$ 20.00")
        end

        it "is correct for decimal" do
            telzir_tariff_calculator = TariffCalculator.new(origin_destination_fare, phone_plan, 20)
            cost = telzir_tariff_calculator.format_cost(2.228)
            expect(cost).to eq("$ 2.23")
        end
    end

    context "Validates if the increase in fare with plan is working" do
        let(:origin_destination_fare) {
            OriginDestinationFare.new(origin: "011",destination: "016",fare: 1.90)
    }
        let(:phone_plan) {
            PhonePlan.new(name:"FaleMais 30",free_time: 30)
    }
        it "is correct for fare of $ 1.9" do
            telzir_tariff_calculator = TariffCalculator.new(origin_destination_fare, phone_plan, 20)
            fare = telzir_tariff_calculator.increase_on_fare_with_plan
            expect(fare).to eq(2.09)
        end
    end

    context "Validate if cost for time is correct" do

        #Teste for the first case

        let(:origin_destination_fare) {
            OriginDestinationFare.new(origin: "011",destination: "016",fare: 1.90)
    }
        let(:phone_plan) {
            PhonePlan.new(name:"FaleMais 30",free_time: 30)
    }

        it "is correct for first case with plan" do
            telzir_tariff_calculator = TariffCalculator.new(origin_destination_fare, phone_plan, 20)
            cost = telzir_tariff_calculator.cost_with_plan
            expect(cost).to eq("$ 0.00")
        end

        it "is correct for first case without plan" do
            telzir_tariff_calculator = TariffCalculator.new(origin_destination_fare, phone_plan, 20)
            cost = telzir_tariff_calculator.cost_without_plan
            expect(cost).to eq("$ 38.00")
        end

        #Test for de second case
    
        let(:origin_destination_fare2) {
            OriginDestinationFare.new(origin: "011",destination: "017",fare: 1.70)
    }
        let(:phone_plan2) {
            PhonePlan.new(name:"FaleMais 60",free_time: 60)
    }
        it "is correct for second case with plan" do
            telzir_tariff_calculator = TariffCalculator.new(origin_destination_fare2, phone_plan2, 80)
            cost = telzir_tariff_calculator.cost_with_plan
            expect(cost).to eq("$ 37.40")
        end

        it "is correct for second case without plan" do
            telzir_tariff_calculator = TariffCalculator.new(origin_destination_fare2, phone_plan2, 80)
            cost = telzir_tariff_calculator.cost_without_plan
            expect(cost).to eq("$ 136.00")
        end

        #Test for de third case
    
        let(:origin_destination_fare3) {
            OriginDestinationFare.new(origin: "018",destination: "011",fare: 1.90)
    }
        let(:phone_plan3) {
            PhonePlan.new(name:"FaleMais 120",free_time: 120)
    }
        it "is correct for second case with plan" do
            telzir_tariff_calculator = TariffCalculator.new(origin_destination_fare3, phone_plan3, 200)
            cost = telzir_tariff_calculator.cost_with_plan
            expect(cost).to eq("$ 167.20")
        end

        it "is correct for second case without plan" do
            telzir_tariff_calculator = TariffCalculator.new(origin_destination_fare3, phone_plan3, 200)
            cost = telzir_tariff_calculator.cost_without_plan
            expect(cost).to eq("$ 380.00")
        end

        #Test for de fourth case
    
        let(:origin_destination_fare4) {
            nil
    }
        let(:phone_plan4) {
            PhonePlan.new(name:"FaleMais 30",free_time: 30)
    }
        it "is correct for second case with plan" do
            telzir_tariff_calculator = TariffCalculator.new(origin_destination_fare4, phone_plan4, 100)
            cost = telzir_tariff_calculator.cost_with_plan
            expect(cost).to eq("-")
        end

        it "is correct for second case without plan" do
            telzir_tariff_calculator = TariffCalculator.new(origin_destination_fare4, phone_plan4, 100)
            cost = telzir_tariff_calculator.cost_without_plan
            expect(cost).to eq("-")
        end
    end
end