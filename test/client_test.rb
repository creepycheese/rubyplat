require 'test_helper'

class ClientTest < Minitest::Test
  def setup
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

    @client = Rubyplat::Client.new
  end

  def test_it_sends_request_with_http
    http_mock = Minitest::Mock.new
    http_mock.expect(:request, 'Test')

    Net::HTTP :new, Object.new do
      params = {
        sender: '2420170',
        receiver: '2420203',
        operator: '2420204',
        accept_keys: 64182,
        date: Date.today,
        session: SecureRandom.hex[0..20],
        number: '9153277169',
        amount: '300.30',
        pay_tool: :foreign_card
      }
      uri = 'https://ru-demo.cyberplat.com/cgi-bin/test_gate/utest_pay_check.cgi/es/es_pay_check.cgi'
      @client.pay_check(params, uri)
    end
  end
end
