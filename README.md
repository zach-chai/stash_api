# StashAPI 
[![Build Status](https://travis-ci.org/zach-chai/stash_api.svg?branch=master)](https://travis-ci.org/zach-chai/stash_api) [![Gem Version](https://badge.fury.io/rb/stash_api.svg)](http://badge.fury.io/rb/stash_api)

A client for interacting with Atlassian Stash API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stash_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stash_api

## Usage

```ruby
StashAPI::Base.domain("stash.mycompany.com") # address of your stash server
StashAPI::Base.basic_auth("username", "password") # optional credentials
```
Now you can send requests to Stash
```ruby
# You can interact with the core rest API as follows
StashAPI::Core.projects.fetch # to return projects
StashAPI::Core.users.fetch # to return users

# to supply query parameters pass them in as a hash
StashAPI::Core.projects.fetch(name: "project_name")

# or if you know the id/key of the resource
StashAPI::Core.projects('ID').fetch
```
Users and projects are a top level resource, accessible directly from Core. To access something like pull requests you need to use resource chaining.
```ruby
# retrieves pull requests for the specified repo
StashAPI::Core.projects('key').repos('slug').pull_requests.fetch
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zach-chai/stash_api. Please add tests to your pull requests so it isn't broken unintentionally.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


