module Rubyplat
  module Requests
    class Check
      def initialize(params = {})
        @sender = params[:sender]
        @receiver = params[:receiver]
      end

      def body
        ["SD=#{@sender}",
         "AP=#{@receiver}"].join("\r\n").encode(Encoding::WINDOWS_1251)
      end
    end
  end
end
