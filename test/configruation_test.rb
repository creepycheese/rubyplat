require 'test_helper'

class ConfigruationTest < Minitest::Test
  def setup
    @config = Rubyplat::Configuration.new
  end

  def test_it_reads_secret_key
    secret_key_path = File.expand_path '../keys/secret.key', __FILE__
    @config.secret_key = secret_key_path

    assert_instance_of String, @config.secret_key
  end

  def test_it_reads_public
    secret_key_path = File.expand_path '../keys/pubkeys.key', __FILE__
    @config.public_key = secret_key_path

    assert_instance_of String, @config.public_key
  end

  def test_it_configures_secret_passphrase
    @config.secret_passphrase = 'very_secret'

    assert 'very_secret', @config.secret_passphrase
  end

  def test_it_configures_public_passphrase
    @config.public_passphrase = 'very_secret'

    assert 'very_secret', @config.public_passphrase
  end
end
