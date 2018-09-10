# frozen_string_literal: true

module Ryo
  module Plugin
    class Whois
      attr_reader :domain
      def initialize(domain)
        @domain = domain
      end

      def endpoint
        "https://domainbigdata.com"
      end

      def fetch_body
        res = Client.http.get("#{endpoint}/#{domain}")
        res.body.to_s
      end

      def doc
        @doc ||= Oga.parse_html(fetch_body)
      end

      def parse
        h = {}
        h[:globa_stats] = globa_stats
        h[:registrant] = registrant
        h
      end

      def globa_stats
        h = {}
        h[:title] = doc.at_css("#trTitle > td:nth-child(2)")&.text
        h[:date_creation] = doc.at_css("#trDateCreation > td:nth-child(2)")&.text
        h[:date_creation] = doc.at_css("#trDateCreation > td:nth-child(2)")&.text
        h[:web_age] = doc.at_css("#trWebAge > td:nth-child(2)")&.text
        h[:ip] = doc.at_css("#trIP > td:nth-child(2)")&.text
        h[:ip_geolocation] = doc.at_css("#trIPGeolocation > td:nth-child(2)")&.text&.strip
        h.compact
      end

      def registrant
        h = {}
        h[:name] = doc.at_css("#trRegistrantName > td:nth-child(2) > a")&.text
        h[:organization] = doc.at_css("#MainMaster_trRegistrantOrganization > td:nth-child(2) > a")&.text
        h[:email] = doc.at_css("#trRegistrantEmail > td:nth-child(2)")&.text
        h[:address] = doc.at_css("#trRegistrantAddress > td:nth-child(2)")&.text
        h[:city] = doc.at_css("#trRegistrantCity > td:nth-child(2)")&.text
        h[:state] = doc.at_css("#trRegistrantState > td:nth-child(2)")&.text
        h[:country] = doc.at_css("#trRegistrantCountry > td:nth-child(2)")&.text
        h[:phone] = doc.at_css("#trRegistrantTel > td:nth-child(2)")&.text
        h[:fax] = doc.at_css("#trRegistrantFax > td:nth-child(2)")&.text
        h[:private] = doc.at_css("#MainMaster_divRegistrantIDCard > div:nth-child(4) > table > tbody > tr:nth-child(10) > td:nth-child(2)")&.text
        h.compact
      end

      def discover
        parse
      end

      def self.discover(domain)
        new(domain).discover
      end
    end
  end
end
