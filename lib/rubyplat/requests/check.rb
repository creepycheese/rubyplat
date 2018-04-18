module Rubyplat
  module Requests
    class Check
      def initialize(params = {})
        @sender = params[:sender]
        @receiver = params[:receiver]
        @operator = params[:operator]
        @date = (params[:date] || Time.now).to_s.strftime('%Y.%m.%d %H:%M:%S')
        @session = params[:session]
      end

      def body
        ["SD=#{@sender}",
         "AP=#{@receiver}",
         "OP=#{@operator}",
         "DATE=#{@date}",
         "SESSION=#{@session}"].join("\r\n").encode(Encoding::WINDOWS_1251)
      end
    end
  end
end
