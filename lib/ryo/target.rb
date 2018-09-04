# frozen_string_literal: true

module Ryo
  class Target
    attr_reader :uri, :domain
    def initialize(uri)
      @uri = URI.parse(uri)
      @domain = Domain.new(@uri.host)
    end
  end
end
