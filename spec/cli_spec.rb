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
      allow(Ryo::Plugin::Dir).to receive(:discover).and_return({})
      allow(Ryo::Plugin::Subdomain).to receive(:discover).and_return({})
      allow(Ryo::Plugin::Tech).to receive(:discover).and_return({})
    }
    it "should output a JSON" do
      output = capture(:stdout) { subject.start %w(tech http://localhost) }
      json = JSON.parse(output)
      expect(json).to be_a(Hash)
    end
  end
  describe "#all" do
    before {
      allow(Ryo::Plugin::Tech).to receive(:discover).and_return({})
    }
    it "should output a JSON" do
      output = capture(:stdout) { subject.start %w(all http://localhost) }
      json = JSON.parse(output)
      expect(json).to be_a(Hash)
    end
  end
end
