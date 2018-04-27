module Rubyplat
  module Utils
    module Parser
      # :nodoc:
      def parse(response_body)
        regex = /BEGIN\n(.*)END\n/m
        body = response_body.match(regex)[1].strip.split("\n")
        params = {}
        body.each do |param|
          k,v = param.split('=')
          params[k.strip.downcase.to_sym] = v
        end

        params
      end
    end
  end
end
