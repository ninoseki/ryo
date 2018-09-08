# frozen_string_literal: true

RSpec.describe Ryo::Plugin::DNS, :vcr do
  subject { Ryo::Plugin::DNS }
  describe "#discover" do
    it "should return a Hash" do
      results = subject.discover "https:/www.example.com/"
      expect(results).to be_an(Hash)
    end
  end
end
