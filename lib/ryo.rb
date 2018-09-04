# frozen_string_literal: true

require "uri"
require "oga"

require "ryo/client"
require "ryo/domain"
require "ryo/target"
require "ryo/plugin"

require "ryo/version"

module Ryo
  def self.discover(uri)
    target = Target.new(uri)

    h = {}
    h[:dir] = Plugin::Dir.discover(target.uri)
    h[:subdomain] = Plugin::Subdomain.discover(target.domain)
    h[:tech] = Plugin::Tech.discover(target.uri)
    h
  end
end
