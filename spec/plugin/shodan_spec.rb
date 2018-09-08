# frozen_string_literal: true

RSpec.describe Ryo::Plugin::Shodan, :vcr do
  subject { Ryo::Plugin::Shodan }
  describe "#discover" do
    context "when given a valid API KEY" do
      it "should return a Hash" do
        results = subject.discover "1.1.1.1"
        expect(results).to be_an(Hash)
      end
    end
    context "when not given an API KEY" do
      before do
        @api_key = ENV["SHODAN_API_KEY"]
        ENV["SHODAN_API_KEY"] = nil
      end
      after { ENV["SHODAN_API_KEY"] = @api_key }
      it "should return a Hash with an error" do
        results = subject.discover "1.1.1.1"
        expect(results).to be_an(Hash)
        expect(results[:error]).to eq("Please set your Shodan API key via ENV['SHODAN_API_KEY']")
      end
    end
  end
end