# frozen_string_literal: true

RSpec.describe Ryo::Plugin::Dir do
  include_context "http_server"

  describe ".discover" do
    subject { Ryo::Plugin::Dir }
    it "should return an Array" do
      results = subject.discover "http://#{host}:#{port}"
      expect(results).to be_an(Array)
      expect(results.length).to eq(1)
      expect(results.first).to include "admin.asp"
    end
  end
end
