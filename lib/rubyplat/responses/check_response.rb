module Rubyplat
  module Responses
    class CheckResponse < Response

      def success?
        result.to_i == 0 && error.to_i == 0
      end
    end
  end
end
