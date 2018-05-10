module Rubyplat
  class SignedRequest
    # @param request [#body] request to be signed with Cyberplat Key
    def initialize(request)
      @request = request
    end

    # @param key [CyberplatPKI::Key] secret key to sign request
    # @return [String] signed request body
    def sign(key)
      key.sign(request.body)
    end

    private

    attr_reader :request
  end
end
