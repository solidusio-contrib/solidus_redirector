# frozen_string_literal: true

$:.push File.expand_path('lib', __dir__)
require 'solidus_redirector/version'

Gem::Specification.new do |spec|
  spec.platform    = Gem::Platform::RUBY
  spec.name        = 'solidus_redirector'
  spec.version     = SolidusRedirector::VERSION
  spec.summary     = 'A Solidus admin interface to redirector'
  spec.description = spec.summary
  spec.license     = 'BSD-3-Clause'
  spec.author    = 'John Hawthorn'
  spec.email     = 'john@freerunningtech.com'
  spec.homepage  = 'https://solidus.io'

  spec.required_ruby_version = Gem::Requirement.new('>= 3.1', '< 4')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }

  spec.test_files = Dir['spec/**/*']
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage if spec.homepage
    spec.metadata["source_code_uri"] = 'https://github.com/solidusio-contrib/solidus_redirector'
  end

  spec.add_dependency 'coffee-rails'
  spec.add_dependency 'redirector'
  spec.add_dependency 'solidus_core', ['>= 2.0.0', '< 5']
  spec.add_dependency 'solidus_support', '~> 0.8'

  spec.add_development_dependency 'solidus_dev_support', '~> 2.10'
end
