# frozen_string_literal: true

module Ryo
  module Plugin
    module Subdomain
      class FindSubDomains < Base
        def endpoint
          "https://findsubdomains.com/subdomains-of"
        end

        def parse
          table = doc.at_css("table#table-view")
          return [] if table.nil?
          table.css("tr")[1..-1].map do |row|
            cols = row.css("td")
            domain = cols.first.at_css("a").text.strip
            ip = cols[1].at_css("a").nil? ? "N/A" : cols[1].at_css("a").text.strip
            { domain: domain, ip: ip }
          end
        end
      end
    end
  end
end
