require 'rails_helper'
require 'data_base_retrieval'

RSpec.describe DataBaseRetrieval, type: :model do
    context "Validate if plans are being correctly retreaved" do

        subject {
            DataBaseRetrieval.new
        }
        it "is correct for first plan" do
            phone_plan = subject.search_plan("FaleMais 30")
            expect(phone_plan.free_time).to eq(30)
        end

        it "is correct for second plan" do
            phone_plan = subject.search_plan("FaleMais 60")
            expect(phone_plan.free_time).to eq(60)
        end

        it "is correct for third plan" do
            phone_plan = subject.search_plan("FaleMais 120")
            expect(phone_plan.free_time).to eq(120)
        end
    end

    context "Validate if relations between origin and destination are being correctly retreaved" do

        subject {
            DataBaseRetrieval.new
        }
        it "is correct for first case" do
            origin_destination_fare = subject.search_fare("011", "16")
            expect(origin_destination_fare.fare).to eq(1.9)
        end

        it "is correct for second case" do
            origin_destination_fare = subject.search_fare("16", "11")
            expect(origin_destination_fare.fare).to eq(2.9)
        end

        it "is correct for third case" do
            origin_destination_fare = subject.search_fare("011", "17")
            expect(origin_destination_fare.fare).to eq(1.7)
        end

    end

    context "Validate if area codes are being rectified" do
        it "is correct for string of lenght 1" do
            code = DataBaseRetrieval.new.rectify_area_code("1")
            expect(code).to eq("001")
        end

        it "is correct for string of lenght 2" do
            code = DataBaseRetrieval.new.rectify_area_code("11")
            expect(code).to eq("011")
        end

        it "is correct for string of lenght 3" do
            code = DataBaseRetrieval.new.rectify_area_code("111")
            expect(code).to eq("111")
        end

        it "is correct for string of lenght 0" do
            code = DataBaseRetrieval.new.rectify_area_code("")
            expect(code).to eq("000")
        end
    end
end