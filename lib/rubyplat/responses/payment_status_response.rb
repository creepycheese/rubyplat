module Rubyplat
  module Responses
    class PaymentStatusResponse < Response
      STATES = {
        1 => "payment_permission_sent",
        3 => "processing",
        7 => "completed"
      }

      def state
        STATES[result.to_i]
      end

      def processing?
        state == 'processing'
      end

      def payment_permission_sent?
        state == 'payment_permission_sent'
      end

      def completed?
        state == 'completed'
      end

      def success?
        result.to_i == 7 && error.to_i == 0
      end
    end
  end
end
