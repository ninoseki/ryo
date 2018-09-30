# frozen_string_literal: true

RSpec.describe Ryo::Plugin::Subdomain::DNSDumpster, :vcr do
  subject { Ryo::Plugin::Subdomain::DNSDumpster }
  describe ".discover" do
    context "when given an existing domain" do
      it "should return a list of subdomains of a given domain" do
        subdomains = subject.discover("example.com")
        expect(subdomains).to be_an(Array)
        first = subdomains.first
        expect(first[:domain]).to eq("www.example.com")
        expect(first[:ip]).to eq("93.184.216.34")
      end
    end
    context "when given a non existing domain" do
      it "should return an empty array" do
        subdomains = subject.discover("non_existing_domain.com")
        expect(subdomains).to be_an(Array)
        expect(subdomains.empty?).to be true
      end
    end
  end
end
