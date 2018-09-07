# frozen_string_literal: true

require "whatweb"

module Ryo
  module Plugin
    class Tech
      def self.discover(uri)
        target = WhatWeb::Target.new(uri)
        plugins = WhatWeb::PluginManager.load_plugins
        results = {}
        plugins.each do |name, plugin|
          result = plugin.execute(target)
          results[name] = result unless result.empty?
        end
        results
      end
    end
  end
end
