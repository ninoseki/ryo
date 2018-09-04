# frozen_string_literal: true

module Ryo
  class CLI < Thor
    desc "dir URL", "Discover directories and files belong to a given URL"
    def dir(url)
      hash = discover(url, dir: true)
      puts hash.to_json
    end

    desc "subdomain URL", "Discover subdomains of a given URL"
    def subdomain(url)
      hash = discover(url, subdomain: true)
      puts hash.to_json
    end

    desc "tech URL", "Discover used technolgies of a given URL"
    def tech(url)
      hash = discover(url, tech: true)
      puts hash.to_json
    end

    desc "all URL", "Run all discovery plugins against a given URL"
    def all(url)
      hash = discover(url, all: true)
      puts hash.to_json
    end

    no_commands do
      def discover(url, options)
        Ryo.discover url, options
      rescue StandardError => e
        { error: "Warning: #{e}" }
      end
    end
  end
end
