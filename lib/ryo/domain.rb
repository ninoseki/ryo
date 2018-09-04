# frozen_string_literal: true

require "ipaddr"

module Ryo
  class Domain
    attr_reader :domain
    def initialize(domain)
      @domain = domain
    end

    def to_s
      domain
    end

    def fld
      @fld ||= String.new.tap do |out|
        removed_tlds_domain = domain.to_s.gsub(tlds_regexp, "")
        parts = removed_tlds_domain.split(".")
        if parts.length == 1 || ip?
          out << domain.to_s
        else
          idx = domain.to_s.split(".").index(parts.last)
          out << domain.to_s.split(".")[idx..-1].join(".")
        end
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
