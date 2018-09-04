# frozen_string_literal: true

require "uri"
require "oga"

require "ryo/client"
require "ryo/target"
require "ryo/plugin"

require "ryo/cli"

require "ryo/version"

module Ryo
  def self.discover(uri, options)
    target = Target.new(uri)

    h = {}
    h[:dir] = Plugin::Dir.discover(target.uri) if options[:dir] || options[:all]
    h[:subdomain] = Plugin::Subdomain.discover(target.fld) if options[:subdomain] || options[:all]
    h[:tech] = Plugin::Tech.discover(target.uri) if options[:tech] || options[:all]
    h
  end
end
