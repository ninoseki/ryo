# frozen_string_literal: true

RSpec.describe Ryo::Plugin::Subdomain::FindSubDomains, :vcr do
  subject { Ryo::Plugin::Subdomain::FindSubDomains }
  describe ".discover" do
    context "when given an existing domain" do
      it "should return a list of subdomains of a given domain" do
        subdomains = subject.discover("test.com")
        expect(subdomains).to be_an(Array)
        test = subdomains.find { |subdomain| subdomain[:domain] == "test.com" }
        expect(test[:ip]).to eq("69.172.200.235")
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
