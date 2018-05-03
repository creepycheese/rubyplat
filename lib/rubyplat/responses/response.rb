module Rubyplat
  module Responses
    class Response
      extend Rubyplat::Utils::Parser

      def self.from_response_string(response)
        new(parse(response))
      end

      # @param params [Hash] hash of params
      def initialize(params = {})
        @date = DateTime.parse(params.delete(:date))

        params.each do |k,v|
          instance_variable_set("@#{k}", v)
          self.class.class_eval { attr_reader k }
        end
      end
    end
  end
end
