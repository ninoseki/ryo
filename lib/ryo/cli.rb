# frozen_string_literal: true

module Ryo
  class CLI < Thor
    desc "cert URL", "Discover an SSL certificate belongs to a given URL"
    def cert(url)
      hash = run_discovery(url, cert: true)
      puts hash.to_json
    end

    desc "dir URL", "Discover directories and files belong to a given URL"
    def dir(url)
      hash = run_discovery(url, dir: true)
      puts hash.to_json
    end

    desc "dns URL", "Discover DNS records of a given URL"
    def dns(url)
      hash = run_discovery(url, dns: true)
      puts hash.to_json
    end

    desc "shodan URL", "Discover Shodan information of a given URL"
    def shodan(url)
      hash = run_discovery(url, shodan: true)
      puts hash.to_json
    end

    desc "subdomain URL", "Discover subdomains of a given URL"
    def subdomain(url)
      hash = run_discovery(url, subdomain: true)
      puts hash.to_json
    end

    desc "tech URL", "Discover used technolgies of a given URL"
    def tech(url)
      hash = run_discovery(url, tech: true)
      puts hash.to_json
    end

    desc "whois URL", "Discover whois information of a given URL"
    def whois(url)
      hash = run_discovery(url, whois: true)
      puts hash.to_json
    end

    desc "urlscan URL", "Discover urlscan.io scan results of a given URL"
    def urlscan(url)
      hash = run_discovery(url, urlscan: true)
      puts hash.to_json
    end

    desc "discover URL", "Run discovery plugin(s) against a given URL"
    method_option :cert, type: :boolean, default: false
    method_option :dir, type: :boolean, default: false
    method_option :shodan, type: :boolean, default: false
    method_option :subdomain, type: :boolean, default: false
    method_option :tech, type: :boolean, default: false
    method_option :urlscan, type: :boolean, default: false
    method_option :whois, type: :boolean, default: false
    def discovery(url)
      hash = run_discovery(url, options)
      puts hash.to_json
    end

    desc "all URL", "Run all discovery plugins against a given URL"
    def all(url)
      hash = run_discovery(url, all: true)
      puts hash.to_json
    end

    no_commands do
      def validate_url(url)
        uri = URI.parse(url)
        raise InvalidURLError unless %w(http https).include?(uri.scheme)
      end

      def validate_options(options)
        raise InvalidOptionsError unless options.any? { |_, v| v }
      end

      def run_discovery(url, options)
        validate_url(url)
        validate_options(options)
        Ryo.discover url, options
      rescue InvalidURLError => _
        { error: "Please input a valid URL" }
      rescue InvalidOptionsError => _
        { error: "Please input at least one option" }
      rescue StandardError => e
        { error: "Warning: #{e}" }
      end
    end
  end
end
