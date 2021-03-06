# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ryo/version"

Gem::Specification.new do |spec|
  spec.name          = "ryo"
  spec.version       = Ryo::VERSION
  spec.authors       = ["Manabu Niseki"]
  spec.email         = ["manabu.niseki@gmail.com"]

  spec.summary       = "Ryo is a yet another website recon tool."
  spec.description   = "Ryo is a yet another website recon tool."
  spec.homepage      = "https://github.com/ninoseki/ryo"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "coveralls", "~> 0.8"
  spec.add_development_dependency "dotenv", "~> 2.5"
  spec.add_development_dependency "glint", "~> 0.1"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rspec", "~> 3.8"
  spec.add_development_dependency "vcr", "~> 4.0"
  spec.add_development_dependency "webmock", "~> 3.4"

  spec.add_dependency "http", "~> 3.3"
  spec.add_dependency "oga", "~> 2.15"
  spec.add_dependency "shodanz", "~> 1.0"
  spec.add_dependency "simple_whatweb", "~> 0.4"
  spec.add_dependency "thor", "~> 0.19"
  spec.add_dependency "thread", "~> 0.2.2"
end
