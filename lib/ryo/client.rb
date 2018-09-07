# frozen_string_literal: true

require "http"

module Ryo
  class Client
    attr_reader :http
    def initialize
      @http = HTTP.headers(user_agent: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.79 Safari/537.36 Edge/14.14393")
    end

    def self.http
      new.http
    end
  end
end
