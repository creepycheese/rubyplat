require 'test_helper'

class SignedRequestTest < Minitest::Test
  def setup

    @check_request = Rubyplat::Requests::PaymentPermission.new(
      sender: 'sender',
      receiver: 'receiver',
      operator: 'operator',
      date: DateTime.parse('2018.05.10 15:16:07'),
      session: 'sess',
      account: 'account',
      amount: 1234.42,
      amount_all: 1234.11,
      req_type: false,
      term_id: '12345',
      comment: 'FooBar',
      accept_keys: '12345',
      pay_tool: :cash,
      no_route: true)

    secret_key_path = File.expand_path '../keys/secret.key', __FILE__
    public_key_path = File.expand_path '../keys/pubkeys.key', __FILE__
    secret_key = '1111111111'
    public_key = '17033'
    Rubyplat.configure do |config|
      config.secret_passphrase = secret_key
      config.public_passphrase = public_key
      config.secret_key = secret_key_path
      config.public_key = public_key_path
    end
    @key = Rubyplat.config.key

    @signed_request = Rubyplat::SignedRequest.new(@check_request).sign(@key)
  end

  def test_it_signed_successfully
    assert @signed_request.include?('SIGNATURE')
  end
end
