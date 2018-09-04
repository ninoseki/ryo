# frozen_string_literal: true

module Ryo
  module Plugin
    module Subdomain
      class Base
        attr_reader :domain
        def initialize(domain)
          @domain = Domain.new(domain)
        end

        def endpoint
          raise NotImplementedError, "You must implement #{self.class}##{__method__}"
        end

        def fetch_body
          res = Client.http.get("#{endpoint}/#{domain.fld}")
          res.body.to_s
        end

        def doc
          @doc ||= Oga.parse_html(fetch_body)
        end

        def parse
          raise NotImplementedError, "You must implement #{self.class}##{__method__}"
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
end
