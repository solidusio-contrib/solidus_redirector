SolidusRedirector
===============

[![CircleCI](https://circleci.com/gh/solidusio-contrib/solidus_redirector.svg?style=svg)](https://circleci.com/gh/solidusio-contrib/solidus_redirector)

A Solidus admin interface to redirector, a rack middleware for HTTP redirects.

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

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake
```

Copyright (c) 2013-2020 John Hawthorn and contributors, released under the New BSD License
