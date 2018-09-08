# frozen_string_literal: true

RSpec.describe Ryo::Target, :vcr do
  subject { Ryo::Target }
  describe "#fld" do
    it "should return a free level domain of a given url" do
      url = "http://test.jp"
      expect(subject.new(url).fld).to eq("test.jp")
      url = "http://test.co.jp"
      expect(subject.new(url).fld).to eq("test.co.jp")
      url = "http://dev.test.co.jp"
      expect(subject.new(url).fld).to eq("test.co.jp")
      url = "http://stg.dev.test.co.jp"
      expect(subject.new(url).fld).to eq("test.co.jp")
      url = "https://dev.test.co.jp"
      expect(subject.new(url).fld).to eq("test.co.jp")
    end
  end
  describe "#ip" do
    it "should return an IP of a given url" do
      url = "http://example.com"
      expect(subject.new(url).ip).to eq("93.184.216.34")
    end
  end
end
