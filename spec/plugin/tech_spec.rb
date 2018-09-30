# frozen_string_literal: true

RSpec.describe Ryo::Plugin::Tech, :vcr do
  subject { Ryo::Plugin::Tech }
  describe ".discover" do
    it "should return a Hash" do
      results = subject.discover "https://www.webscantest.com/"
      expect(results).to be_an(Hash)
    end
  end
end
