module Rubyplat
  module Requests
    class RefillInfo

      # @param [Hash] params arguments to create request
      # @option [Integer] params :sender code for counterparty - sender
      # @option [Integer] params :receiver code for receiver
      # @option [Integer] params :operator receiver-operator
      # @option [String] params :session session
      # @option [String] params :accept_keys receiver-operator
      # @option [String] params :on_date date refills requested on
      #
      def initialize(params = {})
        @sender = params[:sender]
        @receiver = params[:receiver]
        @operator = params[:operator]
        @accept_keys = params[:accept_keys]
        @session = params[:session]
        @on_date = DateTime.parse(params[:on_date].to_s).strftime('%Y%m%d')
      end

      def body
        body_parameters.compact.join("\r\n").encode(Encoding::WINDOWS_1251)
      end

      private

      def body_parameters
        [
          "SD=#{@sender}",
          "AP=#{@receiver}",
          "OP=#{@operator}",
          "SESSION=#{@session}",
          "ACCEPT_KEYS=#{@accept_keys}",
          "ON_DATE=#{@on_date}"
        ]
      end
    end
  end
end
