# frozen_string_literal: true

RSpec.describe Ryo::Plugin::Whois, :vcr do
  subject { Ryo::Plugin::Whois }
  describe ".discover" do
    it "should return a Hash" do
      results = subject.discover "example.com"
      expect(results).to be_an(Hash)
    end
  end
end
