# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

branch = ENV.fetch('SOLIDUS_BRANCH', 'main')
gem 'solidus', github: 'solidusio/solidus', branch: branch

# Needed for Rails 7.0
gem 'concurrent-ruby', '< 1.3.5'

gem 'faraday-retry', '~> 2.2.1'

gem 'rubocop-rails-omakase'

# Fetch the Rails version from the environment variable or default to '~> 7.0'
rails_version = ENV.fetch('RAILS_VERSION', '~> 7.0')
gem 'rails', rails_version

# Extract the minimum Rails version from the version requirement.
# For example, a requirement of "~> 7.0" translates to ">= 7.0" and "< 8.0".
rails_req = Gem::Requirement.new(rails_version)
# Find the minimum version specified by a ">=" constraint, if any.
min_rails_version = rails_req.requirements.find { |op, _| op == '>=' }&.last || Gem::Version.new('0')

# Determine the sqlite3 version based on the minimum Rails version.
# If the minimum Rails version is less than 7.2, use "~> 1.4"; otherwise, use "~> 2.0".
sqlite_version =
  if min_rails_version < Gem::Version.new('7.2')
    "~> 1.4"
  else
    "~> 2.0"
  end

# Select the database adapter based on the DB environment variable.
case ENV.fetch('DB', nil)
when 'mysql'
  gem 'mysql2'
when 'postgresql'
  gem 'pg'
else
  gem 'sqlite3', sqlite_version
end

# While we still support Ruby < 3 we need to workaround a limitation in
# the 'async' gem that relies on the latest ruby, since RubyGems doesn't
# resolve gems based on the required ruby version.
gem 'async', '< 3' if Gem::Version.new(RUBY_VERSION) < Gem::Version.new('3')

gemspec

# Use a local Gemfile to include development dependencies that might not be
# relevant for the project or for other contributors, e.g. pry-byebug.
#
# We use `send` instead of calling `eval_gemfile` to work around an issue with
# how Dependabot parses projects: https://github.com/dependabot/dependabot-core/issues/1658.
send(:eval_gemfile, 'Gemfile-local') if File.exist? 'Gemfile-local'

