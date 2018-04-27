module Rubyplat
  module Responses
    class CheckResponse
      extend Rubyplat::Utils::Parser

      def self.from_response_string(response)
        new(parse(response))
      end

      def initialize(params = {})
        @date = DateTime.parse(params.delete(:date))

        params.each do |k,v|
          instance_variable_set("@#{k}", v)
          self.class.class_eval { attr_reader k }
        end

        def success?
          @result.to_i == 0 && @error.to_i == 0
        end
      end
    end
  end
end
