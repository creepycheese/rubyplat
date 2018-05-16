# Rubyplat
Wrapper for cyberplat payment provider. Uses FFI to call Cyberpat Ipriv library for signing requests.

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
 Rubyplat.configure do |config|
   config.secret_key = '/path/to_key'
   config.public_key = '/path/to_key'
   config.secret_passphrase = 'secret'
   config.public_passphrase = 123123
 end
```

Perform request

```
client = Rubyplat::Client.new

params = {
  sender: '123123',
  receiver: '123123',
  operator: '123123',
  accept_keys: 123123,
  date: Date.today,
  session: SecureRandom.hex[0..20],
  number: '12312312312',
  amount: '300.30',
  pay_tool: :foreign_card
}

client.pay_check(pay_params, 'https://ru-demo.cyberplat.com/cgi-bin/test_gate/utest_pay.cgi/es/es_pay.cgi')
 # => #<Rubyplat::Responses::PaymentPermissionResponse:0x000
client.pay(pay_params, 'https://ru-demo.cyberplat.com/cgi-bin/test_gate/utest_pay.cgi/es/es_pay.cgi')
 # => #<Rubyplat::Responses::PaymentResponse:0x000
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/creepycheese/rubyplat.
