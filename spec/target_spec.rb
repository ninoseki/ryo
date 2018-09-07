RSpec.describe Ryo::Target do
  describe "#fld" do
    subject { Ryo::Target }
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
end