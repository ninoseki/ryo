# frozen_string_literal: true

RSpec.describe Ryo::Plugin::URLscan, :vcr do
  subject { Ryo::Plugin::URLscan }
  describe ".discover" do
    it "should return a Hash" do
      results = subject.discover "http://neverssl.com"
      expect(results).to be_an(Hash)
    end
  end
end
