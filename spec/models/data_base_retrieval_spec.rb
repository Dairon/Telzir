require 'rails_helper'

RSpec.describe DataBaseRetrieval, type: :model do
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