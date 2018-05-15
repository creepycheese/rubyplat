module Rubyplat
  class Client
    InvalidSignature = Class.new(StandardError)

    # @param key [CyberplatPKI::Key] cyberplat secret key to sign request
    # @param pubkey [CyberplatPKI::Key] cyberplat pubkey to verify request
    def initialize(key=Rubyplat.config.key, pubkey=Rubyplat.config.pubkey)
      @key, @pubkey = key, pubkey
    end

    # @param params [Hash] arguments to create request
    # @option params [String] :sender sender of request
    # @option params [String] :receiver request receiver
    # @option params [String] :operator operator
    # @option params [String] :date request date
    # @option params [String] :session uniq session identifier non longer than 20
    # @option params [String] :number phone number or payer's account number(can be blank)
    # @option params [String] :account payer's identifier or payees service identifier. Can be blank.
    # @option params [Float] :amount amount to be payed. example: 1234.12
    # @param vendor_or_uri [String, Rubyplat::Gateways::Gateway] string or gateway for cyberplat
    # @return [Rubyplat::Responses::PaymentPermissionResponse] response
    # @return [Net::HTTPBadRequest] instance of bad request
    # @raise [AccountBalanceError] if the response signature is invalid
    #   raises error
    def pay_check(params = {}, vendor_or_uri)
      uri = vendor_or_uri.kind_of?(String) ? URI(vendor_or_uri) : vendor_or_uri.pay_check_uri
      request = Rubyplat::Requests::PaymentPermission.new(params)
      response = send_request(request, uri)

      if response.code == '200'
        raise InvalidSignature unless pubkey.verify(response.body)

        Rubyplat::Responses::PaymentPermissionResponse.from_response_string(response.body)
      else
        request
      end
    end

    def pay

    end

    def pay_status

    end

    private

    attr_reader :pubkey, :key

    def read_response(response_klass)

    end

    # sends signed request and returns parsed cyberplat response
    # request [#body] cyberplat request to be signed and sent
    def send_request(request, uri)
      signed_request_body = Rubyplat::SignedRequest.new(request).sign(key)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      header = { 'Content-Type': 'application/x-www-form-urlencoded' }
      request = Net::HTTP::Post.new(uri.request_uri, header)
      request.body = signed_request_body

      response = http.request(request)
    end
  end
end
