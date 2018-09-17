# frozen_string_literal: true

module Ryo
  module Plugin
    class Cert
      attr_reader :domain
      def initialize(domain)
        @domain = domain
      end

      def endpoint
        "https://certdb.com"
      end

      def fetch_body
        res = Client.http.get("#{endpoint}/domain/#{domain}")
        res.body.to_s
      end

      def doc
        @doc ||= Oga.parse_html(fetch_body)
      end

      def parse
        table = doc.at_css("table.cdb-table-result")
        return [] unless table

        table.css("tr")[1..-1].map do |row|
          domain_name = row.at_css("td.domains-list")
          detail = row.at_css("td.detail-btn > a")
          {
            domain: domain_name&.text&.strip,
            detail: detail&.get("href")
          }
        end
      end

      def discover
        results = parse
        matched = results.find { |e| e[:domain] == domain }
        if matched
          # /ssl-cert/f8ecdde99545ae249eed405cfe61d8ed
          id = matched[:detail].split("/").last
          res = Client.http.get("#{endpoint}/json/#{id}")
          JSON.parse res.body.to_s
        else
          { error: "N/A" }
        end
      end

      def self.discover(domain)
        new(domain).discover
      end
    end
  end
end
