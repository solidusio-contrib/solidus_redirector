# frozen_string_literal: true

$:.push File.expand_path('lib', __dir__)
require 'solidus_redirector/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'solidus_redirector'
  s.version     = SolidusRedirector::VERSION
  s.summary     = 'A Solidus admin interface to redirector'
  s.description = s.summary
  s.license     = 'BSD-3-Clause'

  s.required_ruby_version = '> 2.4'

  s.author    = 'John Hawthorn'
  s.email     = 'john@freerunningtech.com'
  s.homepage  = 'https://solidus.io'

  s.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  s.test_files = Dir['spec/**/*']
  s.bindir = "exe"
  s.executables = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  if s.respond_to?(:metadata)
    s.metadata["homepage_uri"] = s.homepage if s.homepage
    s.metadata["source_code_uri"] = 'https://github.com/solidusio-contrib/solidus_redirector'
  end

  s.add_dependency 'redirector'
  s.add_dependency 'solidus_core', ['>= 2.0.0', '< 4']
  s.add_dependency 'solidus_support', '~> 0.5'

  s.add_development_dependency 'solidus_dev_support'
end
