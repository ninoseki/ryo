# frozen_string_literal: true

require "thread"
require "thread/pool"

module Ryo
  module Plugin
    class Dir
      attr_reader :uri, :threads
      def initialize(uri)
        @uri = uri.is_a?(URI::HTTP) ? uri : URI.parse(uri)
        @threads = 10
      end

      def paths
        File.readlines(File.expand_path("./aux/paths.txt", __dir__)).map(&:chomp).compact
      end

      def url_for(path)
        "#{uri.scheme}://#{uri.host}:#{uri.port}/#{path}"
      end

      def discover
        pool = Thread.pool(threads)
        results = []
        paths.map { |path| url_for(path) }.each do |url|
          pool.process {
            res = Client.http.get(url)
            results << url if res.code == 200
          }
        end
        pool.shutdown
        results
      end

      def self.discover(uri)
        new(uri).discover
      end
    end
  end
end
