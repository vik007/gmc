# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gmc/version"
require "gmc/client"
require "gmc/configuration"

Gem::Specification.new do |spec|
  spec.name          = "gmc"
  spec.version       = Gmc::VERSION
  spec.authors       = ["Varun Kothari"]
  spec.email         = ["varunkothari007@gmail.com"]

  spec.summary       = "GMC is Google merchant API for Product"
  spec.description   = "APIs to upload product details on the merchant center."
  spec.homepage      = "https://throughouttechnologies.com/contact_us"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/vik007/gmc"
  spec.metadata["changelog_uri"] = "https://throughouttechnologies.com/contact_us"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  # spec.files = Dir.chdir(File.expand_path(__dir__)) do
  #   `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  # end

  spec.files = [
    "lib/gmc.rb",
    "lib/gmc/version.rb",
    "lib/gmc/client.rb",
    "lib/gmc/configuration.rb"
  ]

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
