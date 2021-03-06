# frozen_string_literal: true

require "oga"
require "uri"

require "ryo/error"

require "ryo/client"
require "ryo/target"
require "ryo/plugin"

require "ryo/cli"

require "ryo/version"

module Ryo
  def self.discover(uri, options)
    target = Target.new(uri)

    h = {}
    h[:cert] = Plugin::Cert.discover(target.domain) if options[:cert] || options[:all]
    h[:dir] = Plugin::Dir.discover(target.uri) if options[:dir] || options[:all]
    h[:dns] = Plugin::DNS.discover(target.domain) if options[:dns] || options[:all]
    h[:shodan] = Plugin::Shodan.discover(target.ip) if options[:shodan] || options[:all]
    h[:subdomain] = Plugin::Subdomain.discover(target.fld) if options[:subdomain] || options[:all]
    h[:tech] = Plugin::Tech.discover(target.uri) if options[:tech] || options[:all]
    h[:urlscan] = Plugin::URLscan.discover(target.domain) if options[:urlscan] || options[:all]
    h[:whois] = Plugin::Whois.discover(target.domain) if options[:whois] || options[:all]
    h
  end
end
