RSpec.describe Ryo::Domain do
  describe "#fld" do
    it "should return a free level domain of a given domain/url" do
      domain = "test.jp"
      expect(Ryo::Domain.new(domain).fld).to eq("test.jp")
      domain = "test.co.jp"
      expect(Ryo::Domain.new(domain).fld).to eq("test.co.jp")
      domain = "dev.test.co.jp"
      expect(Ryo::Domain.new(domain).fld).to eq("test.co.jp")
      domain = "stg.dev.test.co.jp"
      expect(Ryo::Domain.new(domain).fld).to eq("test.co.jp")
      domain = "https://dev.test.co.jp"
      expect(Ryo::Domain.new(domain).fld).to eq("test.co.jp")
    end
  end
end