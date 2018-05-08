require "test_helper"

class RubyplatTest < Minitest::Test
  def test_it_configures
    secret_key_path = File.expand_path '../keys/secret.key', __FILE__
    public_key_path = File.expand_path '../keys/pubkeys.key', __FILE__
    secret_key = 'very_secret'
    public_key = 'public_key'
    Rubyplat.configure do |config|
      config.secret_passphrase = secret_key
      config.public_passphrase = public_key
      config.secret_key = secret_key_path
      config.public_key = public_key_path
    end

    assert_equal secret_key, Rubyplat.config.secret_passphrase
    assert_equal public_key, Rubyplat.config.public_passphrase
  end
end
