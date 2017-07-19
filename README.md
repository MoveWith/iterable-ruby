# Iterable

[![Build Status](https://travis-ci.org/revvco/iterable-api?branch=master)](https://travis-ci.org/revvco/iterable-api) [![Code Climate](https://codeclimate.com/github/revvco/iterable-api/badges/gpa.svg)](https://codeclimate.com/github/revvco/iterable-api)

A Ruby wrapper for the Iterable API. Documentation can be found [here](https://api.iterable.com/api/docs).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'iterable-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iterable-api

## Usage

### Client

```ruby
require 'iterable-api`

client = Iterable::Api.new('YOUR_API_KEY')
client.lists
```

### Supported Endpoints

All responses are sent back as `Hashie` objects

#### Lists

* `lists` - return all lists
* `lists/subscribe` -  subscribe a user to a list

#### Users

* `users/{email}` - find a user by email
* `users/{id}` - find a user by id
* `users/update` - update a user

#### Commerce

* `commerce/track_purchase` - create a new CommerceItem

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/iterable-api.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

