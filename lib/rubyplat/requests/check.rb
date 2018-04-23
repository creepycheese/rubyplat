module Rubyplat
  module Requests
    class Check

      # @param [Hash] params arguments to create request
      # @option params :sender sender of request
      # @option params :receiver request receiver
      # @option params :operator operator
      # @option params :date request date
      # @option params :session session
      def initialize(params = {})
        @sender = params[:sender]
        @receiver = params[:receiver]
        @operator = params[:operator]
        @date = DateTime.parse((params[:date] || Time.now).to_s).strftime('%Y.%m.%d %H:%M:%S')
        @session = params[:session]
        @number = params[:number]
      end

      # @return [String] String representation of request
      # @example
      #   @check_request = Rubyplat::Requests::Check.new(
      #     sender: 'sender',
      #     receiver: 'receiver',
      #     operator: 'operator',
      #     date: Time.now,
      #     session: 'sess')
      #   @check_request.body #=> "SD=sender\r\nAP=receiver\r\nOP=operator\r\nDATE=2018.04.23 16:47:28\r\nSESSION=sess"
      def body
        ["SD=#{@sender}",
         "AP=#{@receiver}",
         "OP=#{@operator}",
         "DATE=#{@date}",
         "SESSION=#{@session}",
         @number && "NUMBER=#{@number}"].compact.join("\r\n").encode(Encoding::WINDOWS_1251)
      end
    end
  end
end
