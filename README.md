# CallRail

API Wrapper for CallRail API v2

## Installation


```ruby
gem 'call_rail'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install call_rail

## Usage

```ruby

CallRail.configure do |config| 
  config.api_key = '<api key>'
end
```

### Get all connected accounts

```ruby
  CallRail::Account.all
```

### Get all businesses inside an account

```ruby
  account = Account.find(<account_id>)
  account.businesses
```

### Get all calls inside an account

```ruby
  account = Account.find(<account_id>)
  account.calls
```

### Filtering

You can add filters as specified in the api documention
Eg

```ruby
  Account.all(page: 2)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/redpanthers/call_rail. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the CallRail project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/redpanthers/call_rail/blob/master/CODE_OF_CONDUCT.md).
