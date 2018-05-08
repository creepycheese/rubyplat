# Rubyplat
Wrapper for cyberplat payment provider. Uses FFI to call Cyberpat Ipriv library for signing requests.

TODO: Config
TODO: How to compile lib
TODO: Caveeats
TODO: API and usage

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubyplat'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubyplat

## Usage

### Confiuration

In your initializer configure keys for signing and verifying requests

```ruby
 # rubyplat.rb

 Rubyplat.configure do |config|
   config.secret_key = '/path/to_key'
   config.public_key = '/path/to_key'
 end

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/creepycheese/rubyplat.
