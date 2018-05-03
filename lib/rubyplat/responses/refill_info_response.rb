module Rubyplat
  module Responses
    class RefillInfoResponse < Response
      def success?
        result.to_i == 0 && error.to_i == 0
      end

      # UTF-8 representation of DATA field
      # @return [String] refills info def decoded_data
      def decoded_data
        URI.unescape(@data).encode('UTF-8', 'Windows-1251')
      end
    end
  end
end
