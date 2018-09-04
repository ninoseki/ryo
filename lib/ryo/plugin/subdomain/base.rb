# frozen_string_literal: true

module Ryo
  module Plugin
    module Subdomain
      class Base
        attr_reader :fld
        def initialize(fld)
          @fld = fld
        end

        def endpoint
          raise NotImplementedError, "You must implement #{self.class}##{__method__}"
        end

        def fetch_body
          res = Client.http.get("#{endpoint}/#{fld}")
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

        def self.discover(fld)
          new(fld).discover
        end
      end
    end
  end
end
