module Rubyplat
  module Responses
    class CheckBalanceResponse < Response

      def success?
        error.to_i == 0
      end

      # REST field
      # @return [Float] available amount for client
      def rest_limit
       Float(@rest)
      end

      # current amount of available funds for client.
      # @return [Float] REST_WO_LIMIT
      def available_limit
        Float(@rest_wo_limit)
      end

      # amount of daily available funds
      # @return [Float] AP_DAILY_LIMIT if set
      # @return [nil] if not set
      def daily_limit
        @ap_daily_limit && Float(@ap_daily_limit)
      end

      # maximum amount be paid with single payment
      # @return [Float] AP_DAILY_LIMIT if set
      # @return [nil] if not set
      def max_payment_limit
        @ap_payment_limit && Float(@ap_payment_limit)
      end
    end
  end
end
