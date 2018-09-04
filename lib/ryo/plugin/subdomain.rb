# frozen_string_literal: true

require_relative "subdomain/base"
require_relative "subdomain/dnsdumpster"
require_relative "subdomain/find_subdomains"

module Ryo
  module Plugin
    module Subdomain
      def self.discover(domain)
        subdomains = []
        subdomains << DNSDumpster.discover(domain)
        subdomains << FindSubDomains.discover(domain)
        subdomains.flatten.uniq.sort_by { |e| e[:domain] }
      end
    end
  end
end
