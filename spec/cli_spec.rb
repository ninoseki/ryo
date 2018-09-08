# frozen_string_literal: true

RSpec.describe Ryo::CLI do
  subject { Ryo::CLI }
  describe "#dir" do
    before {
      allow(Ryo::Plugin::Dir).to receive(:discover).and_return({})
    }
    it "should output a JSON" do
      output = capture(:stdout) { subject.start %w(dir http://localhost) }
      json = JSON.parse(output)
      expect(json).to be_a(Hash)
    end
  end
  describe "#subdomain" do
    before {
      allow(Ryo::Plugin::Subdomain).to receive(:discover).and_return({})
    }
    it "should output a JSON" do
      output = capture(:stdout) { subject.start %w(subdomain http://localhost) }
      json = JSON.parse(output)
      expect(json).to be_a(Hash)
    end
  end
  describe "#tech" do
    before {
      allow(Ryo::Plugin::Tech).to receive(:discover).and_return({})
    }
    it "should output a JSON" do
      output = capture(:stdout) { subject.start %w(tech http://localhost) }
      json = JSON.parse(output)
      expect(json).to be_a(Hash)
    end
  end
  describe "#whois" do
    before {
      allow(Ryo::Plugin::Whois).to receive(:discover).and_return({})
    }
    it "should output a JSON" do
      output = capture(:stdout) { subject.start %w(whois http://localhost) }
      json = JSON.parse(output)
      expect(json).to be_a(Hash)
    end
  end
  describe "#discover" do
    context "when given an empty options" do
      it "should return a JSON with an error message" do
        output = capture(:stdout) { subject.start %w(discover http://localhost) }
        json = JSON.parse(output)
        expect(json["error"]).to eq("Please input at least one option")
      end
    end
    context "when given valid options" do
      before {
        allow(Ryo::Plugin::Whois).to receive(:discover).and_return({})
      }
      it "should return a JSON" do
        output = capture(:stdout) { subject.start %w(discover http://localhost --whois) }
        json = JSON.parse(output)
        expect(json).to be_a(Hash)
      end
    end
  end
  describe "#all" do
    before {
      allow(Ryo::Plugin::Dir).to receive(:discover).and_return({})
      allow(Ryo::Plugin::DNS).to receive(:discover).and_return({})
      allow(Ryo::Plugin::Subdomain).to receive(:discover).and_return({})
      allow(Ryo::Plugin::Tech).to receive(:discover).and_return({})
      allow(Ryo::Plugin::Whois).to receive(:discover).and_return({})
    }
    it "should output a JSON" do
      output = capture(:stdout) { subject.start %w(all http://localhost) }
      json = JSON.parse(output)
      expect(json).to be_a(Hash)
    end
  end
end
