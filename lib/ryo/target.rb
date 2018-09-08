# frozen_string_literal: true

require "ipaddr"

module Ryo
  class Target
    attr_reader :uri, :domain
    def initialize(uri)
      @uri = URI.parse(uri)
      @domain = @uri.host
    end

    def fld
      @fld ||= String.new.tap do |out|
        removed_tlds_domain = domain.gsub(tlds_regexp, "")
        # test.com => ["test"]
        # dev.test.com => ["dev", "test"]
        parts = removed_tlds_domain.split(".")
        if parts.length == 1 || ip?
          out << domain
        else
          idx = domain.split(".").index(parts.last)
          out << domain.split(".")[idx..-1].join(".")
        end
      end
    end

    def ip
      @ip ||= String.new.tap do |out|
        h = Plugin::DNS.new(domain).dig("A")
        out << (h.dig("Answer")&.first&.dig("data") || "N/A")
      end
    end

    private

    def tlds
      File.readlines(File.expand_path("./aux/tlds.txt", __dir__)).map(&:chomp).compact
    end

    def tlds_regexp
      Regexp.new tlds.map { |domain| "#{domain.split('.').join('\\.')}$" }.join("|")
    end

    def ip?
      IPAddr.new(domain.to_s)
      true
    rescue IPAddr::InvalidAddressError => _
      false
    end
  end
end
