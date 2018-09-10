# frozen_string_literal: true

require "shodanz"

module Ryo
  module Plugin
    class Shodan
      attr_reader :client
      def initialize
        raise ArgumentError, "Please set your Shodan API key via ENV['SHODAN_API_KEY']" unless ENV["SHODAN_API_KEY"]
        @client = Shodanz.client.new
      end

      def discover(ip)
        ip == "N/A" ? { error: "Invalid IP" } : client.rest_api.host(ip)
      end

      def self.discover(ip)
        new.discover(ip)
      rescue ArgumentError => e
        { error: e.to_s }
      rescue StandardError => e
        { error: e.to_s }
      end
    end
  end
end
