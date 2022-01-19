# Iterable

A Ruby wrapper for the Iterable API. Documentation can be found [here](https://api.iterable.com/api/docs).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'iterable-ruby', require: 'iterable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iterable-ruby

## Usage

### Client

```ruby
require 'iterable-ruby`

client = Iterable::Api.new('YOUR_API_KEY')
client.lists
```

### Supported Endpoints

All responses are sent back as `Hashie` objects
#### Emails
* `email/target` - send a targeted email
```ruby
client = Iterable::Api.new('YOUR_API_KEY')
client.send_email(Iterable::Requests::TargetedEmail)
```

#### Events
* `events/track` - track an event
```ruby
client = Iterable::Api.new('YOUR_API_KEY')
client.track_event(Iterable::Requests::TrackEvent)
```

#### Lists

* `lists` - return all lists
* `lists/subscribe` -  subscribe a user to a list
```ruby
client = Iterable::Api.new('YOUR_API_KEY')
client.lists_subscribe(list_id, [Iterable::User])
```
* `lists/unsubscribe` -  unsubscribe a user to a list
```ruby
client = Iterable::Api.new('YOUR_API_KEY')
client.lists_unsubscribe(list_id, [Iterable::User])
```

#### Message Types
* `messageTypes` - return all Message Types
```ruby
client = Iterable::Api.new('YOUR_API_KEY')
client.message_types
```

#### Templates
* `templates` - return all templates
```ruby
client = Iterable::Api.new('YOUR_API_KEY')
client.templates
```

#### Users

* `users/getFields` - get user fields
* `users/{email}` - find a user by email
* `users/{id}` - find a user by id
* `users/update` - update a user
```ruby
client = Iterable::Api.new('YOUR_API_KEY')
client.user_update(Iterable::User)
```
* `users/updateSubscriptions` - update a user's subscriptions
```ruby
client = Iterable::Api.new('YOUR_API_KEY')
client.user_update_subscriptions(Iterable::Requests::SubscriptionUpdate)

client.unsubscribe_all("email_address")
```

#### Commerce

* `commerce/track_purchase` - create a new CommerceItem

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/movewith/iterable-ruby.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

