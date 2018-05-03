module Rubyplat
  module Requests
    class PaymentStatus

      # @param [Hash] params arguments to create request
      # @option [String] params :session 1-20 symbols session identifier
      # @option [String] params :transid 13-digits payment identifier for Cyberplat(not required)
      # @option [String] params :accept_keys serial key number
      #
      def initialize(params = {})
        @session = params[:session]
        @transid = params[:transid]
        @accept_keys = params[:accept_keys]
      end

      def body
        body_parameters.compact.join("\r\n").encode(Encoding::WINDOWS_1251)
      end

      private

      def body_parameters
        [
          "SESSION=#{@session}",
          @transid && "TRANSID=#{@transid}",
          "ACCEPT_KEYS=#{@accept_keys}"
        ]
      end
    end
  end
end
