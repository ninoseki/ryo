# frozen_string_literal: true

RSpec.describe Ryo, :vcr do
  include_context "http_server"

  it "has a version number" do
    expect(Ryo::VERSION).not_to be nil
  end

  describe "#discover" do
    subject { Ryo }
    it "should return a Hash" do
      results = subject.discover("http://#{host}:#{port}", all: true)
      expect(results).to be_a(Hash)
    end
  end
end
