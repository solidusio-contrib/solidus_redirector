SolidusRedirector
===============

[![CircleCI](https://circleci.com/gh/solidusio-contrib/solidus_redirector.svg?style=svg)](https://circleci.com/gh/solidusio-contrib/solidus_redirector)

A Solidus admin interface to redirector, a rack middleware for HTTP redirects. It allows administrators to easily manage and configure redirects within a Solidus-powered e-commerce store, improving SEO and user experience by ensuring that outdated or incorrect URLs are properly redirected.

Installation
------------

Add solidus_redirector to your Gemfile:

```ruby
gem 'solidus_redirector', github: 'solidusio-contrib/solidus_redirector'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bin/rails g solidus_redirector:install
```

### Sandbox
-----------

To run this extension in a sandboxed Solidus application, you can run bin/sandbox

This sandbox includes solidus\_auth\_devise and generates with seed and sample
data already loaded.

* Create the sandbox application

  ```bash
  bin/sandbox
  ```

  You can create a sandbox with PostgreSQL or MySQL by setting the DB environment variable.

  ```bash
  # PostgreSQL
  export DB=postgresql
  bin/sandbox

  # MySQL
  export DB=mysql
  bin/sandbox
  ```

  Depending on your local environment, it may be necessary for you to set environment variables for your RDBMS, namely:
    - `DB_HOST`
    - `DB_USER`
    - `DB_PASSWORD`

  If you need to create a Rails 5.2 application for your sandbox, for example
  if you are still using Ruby 2.4 which is not supported by Rails 6, you can
  use the `RAILS_VERSION` environment variable.

  ```bash
    export RAILS_VERSION='~> 5.2.0'
    bin/setup
    bin/sandbox
  ```

Please note: if you run `bin/rails server` or similar commands, only the Rails server will
start. This might cause the error `couldn't find file 'solidus_admin/tailwind.css'` when you
try to load admin pages.

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake
```

Copyright (c) 2013-2020 John Hawthorn and contributors, released under the New BSD License
