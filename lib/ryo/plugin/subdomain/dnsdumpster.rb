# frozen_string_literal: true

module Ryo
  module Plugin
    module Subdomain
      class DNSDumpster < Base
        def endpoint
          "https://dnsdumpster.com"
        end

        def fetch_body
          res = Client.http.get(endpoint)
          csrftoken = res.cookies.find { |c| c.name == "csrftoken" }.value
          params = { csrfmiddlewaretoken: csrftoken, targetip: fld }

          res = Client.http.cookies(csrftoken: csrftoken).headers(referer: endpoint).post(endpoint, form: params)
          res.body.to_s
        end

        def parse
          tables = doc.css("table.table")
          return [] if tables.empty?
          table = tables.last
          table.css("tr").map do |row|
            cols = row.css("td")
            domain = cols.first.text.lines.first.chomp
            ip = cols[1].text.lines.first.chomp
            { domain: domain, ip: ip }
          end
        end
      end
    end
  end
end
