# frozen_string_literal: true

module Ryo
  module Plugin
    class URLscan
      def endpoint
        "https://urlscan.io/api/v1"
      end

      def discover(query)
        q = '"' + query.to_s + '"'
        res = Client.http.get("#{endpoint}/search", params: { q: q })
        JSON.parse(res.body)
      end

      def self.discover(query)
        new.discover(query)
      end
    end
  end
end
