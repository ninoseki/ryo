# frozen_string_literal: true

require_relative "subdomain/base"
require_relative "subdomain/dnsdumpster"
require_relative "subdomain/find_subdomains"

module Ryo
  module Plugin
    module Subdomain
      def self.discover(fld)
        subdomains = []
        subdomains << DNSDumpster.discover(fld)
        subdomains << FindSubDomains.discover(fld)
        subdomains.flatten.uniq.sort_by { |e| e[:domain] }
      end
    end
  end
end
