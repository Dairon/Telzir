require 'rails_helper'

RSpec.describe TelzirTariffCalculator, type: :model do
    context "Validate if cost of time with plan is correct" do

        #Teste for the first case

        let(:origin_destination_fare) {
            OriginDestinationFare.new(origin: "011",destination: "016",fare: 1.90)
    }
        let(:phone_plan) {
            PhonePlan.new(name:"FaleMais 30",free_time: 20)
    }

        it "is correct for first case with plan" do
            telzir_tariff_calculator = TelzirTariffCalculator.new(origin_destination_fare, phone_plan, 20)
            cost = telzir_tariff_calculator.cost_with_plan
            expect(cost).to eq("$ 0.00")
        end

        it "is correct for first case without plan" do
            telzir_tariff_calculator = TelzirTariffCalculator.new(origin_destination_fare, phone_plan, 20)
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
            telzir_tariff_calculator = TelzirTariffCalculator.new(origin_destination_fare2, phone_plan2, 80)
            cost = telzir_tariff_calculator.cost_with_plan
            expect(cost).to eq("$ 37.40")
        end

        it "is correct for second case without plan" do
            telzir_tariff_calculator = TelzirTariffCalculator.new(origin_destination_fare2, phone_plan2, 80)
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
            telzir_tariff_calculator = TelzirTariffCalculator.new(origin_destination_fare3, phone_plan3, 200)
            cost = telzir_tariff_calculator.cost_with_plan
            expect(cost).to eq("$ 167.20")
        end

        it "is correct for second case without plan" do
            telzir_tariff_calculator = TelzirTariffCalculator.new(origin_destination_fare3, phone_plan3, 200)
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
            telzir_tariff_calculator = TelzirTariffCalculator.new(origin_destination_fare4, phone_plan4, 100)
            cost = telzir_tariff_calculator.cost_with_plan
            expect(cost).to eq("-")
        end

        it "is correct for second case without plan" do
            telzir_tariff_calculator = TelzirTariffCalculator.new(origin_destination_fare4, phone_plan4, 100)
            cost = telzir_tariff_calculator.cost_without_plan
            expect(cost).to eq("-")
        end
    end
end