# frozen_string_literal: true

module Ryo
  module Plugin
    class Dir
      attr_reader :uri
      def initialize(uri)
        @uri = uri.is_a?(URI::HTTP) ? uri : URI.parse(uri)
      end

      def paths
        File.readlines(File.expand_path("./aux/paths.txt", __dir__)).map(&:chomp).compact
      end

      def url_for(path)
        "#{uri.scheme}://#{uri.host}:#{uri.port}/#{path}"
      end

      def discover
        paths.map { |path| url_for(path) }.select do |url|
          res = Client.http.get(url)
          res.code == 200
        end
      end

      def self.discover(uri)
        new(uri).discover
      end
    end
  end
end
