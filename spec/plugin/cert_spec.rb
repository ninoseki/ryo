# frozen_string_literal: true

RSpec.describe Ryo::Plugin::Cert, :vcr do
  subject { Ryo::Plugin::Cert }
  describe ".discover" do
    it "should return a Hash" do
      results = subject.discover "github.com"
      expect(results).to be_an(Hash)
    end
  end
end
