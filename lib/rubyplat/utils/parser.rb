module Rubyplat
  module Utils
    module Parser

      # @param response_body [String] response from cyberplat api
      # @return [Hash] hash of key value hashes
      def parse(response_body)
        regex = /BEGIN\n(.*)END\n/m
        require 'pry'; binding.pry if response_body.include?('DATA')
        body = response_body.match(regex)[1].scan(/(?<key>.*)=(?<value>.*)\n/)
        params = {}
        body.each do |param|
          k,v = param
          params[k.strip.downcase.to_sym] = v
        end
        params
      end
    end
  end
end
