# frozen_string_literal: true

module Ryo
  module Plugin
    class DNS
      TYPES = %w(A AAAA CNAME MX NS SOA TXT).freeze

      attr_reader :domain
      def initialize(domain)
        @domain = domain
      end

      def endpoint
        "https://dns.google.com/resolve"
      end

      def fetch_body(params)
        res = Client.http.get(endpoint, params: params)
        res.body.to_s
      end

      def dig(type)
        params = { name: domain, type: type }
        body = fetch_body(params)
        JSON.parse(body)
      end

      def discover
        h = {}
        TYPES.each do |type|
          h[type] = dig(type)
        end
        h
      end

      def self.discover(domain)
        new(domain).discover
      end
    end
  end
end
