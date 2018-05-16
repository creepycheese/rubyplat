module Rubyplat
  class SignedRequest
    # @param request [#body] request to be signed with Cyberplat Key
    def initialize(request)
      @request = request
    end

    # @param key [CyberplatPKI::Key] secret key to sign request
    # @return [String] signed request body
    def sign(key)
      msg = 'inputmessage='
      msg << URI.encode(key.sign(request.body).encode(Encoding::WINDOWS_1251))
      msg
    end

    private

    attr_reader :request
  end
end
