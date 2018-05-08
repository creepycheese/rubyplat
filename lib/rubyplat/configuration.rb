module Rubyplat
  # @attr_reader [String] secret_key secret key for signing requests
  # @attr_reader [String] public_key public key for verifying requests
  class Configuration
    attr_reader :secret_key, :public_key
    attr_accessor :secret_passphrase, :public_passphrase

    # @param key_path [String] path to secret key
    def secret_key=(key_path)
      @secret_key = File.read(key_path)
    end

    # @param key_path [String] path to public key
    def public_key=(key_path)
      @public_key = File.read(key_path)
    end

    # secret key used for signing requests
    # @return [CyberplatPKI::Key] an instance of key
    def key
      @key ||= CyberplatPKI::Key.new_private(secret_key, secret_passphrase)
    end

    # public key used for verifying requests
    # @return [CyberplatPKI::Key] an instance of key
    def pubkey
      @pubkey ||= CyberplatPKI::Key.new_public(public_key, public_passphrase)
    end
  end
end
