module Rubyplat
  module Requests
    class PaymentRequest

      # @param params [Hash] arguments to create request
      # @option params [String] :sender sender of request
      # @option params [String] :receiver request receiver
      # @option params [String] :operator operator
      # @option params [String] :date request date
      # @option params [String] :session session
      # @option params [String] :number phone number or payer's account number(can be blank)
      # @option params [String] :account payer's identifier or payees service identifier. Can be blank.
      # @option params [Float] :amount amount to be payed. example: 1234.12
      #
      def initialize(params = {})
        params = defaults.merge(params)

        @sender = params[:sender]
        @receiver = params[:receiver]
        @operator = params[:operator]
        @date = DateTime.parse((params[:date] || Time.now).to_s).strftime('%Y.%m.%d %H:%M:%S')
        @session = params[:session]
        @number = params[:number]
        @account = params[:account]
        @amount = params[:amount]
        @req_type = params[:req_type]
        @pay_tool = Rubyplat::PAYTOOL.fetch(params[:paytool]) { nil }
        @term_id = params[:term_id]
        @comment = params[:comment]
        @accept_keys = params[:accept_keys]
        @no_route = params[:no_route]
        @amount_all = params[:amount_all]
        @rrn = params[:rrn]
      end

      def body
        body_parameters.compact.join("\r\n").encode(Encoding::WINDOWS_1251)
      end

      private

      def defaults
        { pay_tool: 0, no_route: false }
      end

      def body_parameters
        [
          "SD=#{@sender}",
          "AP=#{@receiver}",
          "OP=#{@operator}",
          "DATE=#{@date}",
          "SESSION=#{@session}",
          @number && "NUMBER=#{@number}",
          "ACCOUNT=#{@account}",
          "AMOUNT=#{@amount}",
          "REQ_TYPE=#{@req_type ? 1 : 0}",
          "PAY_TOOL=#{@pay_tool}",
          "TERM_ID=#{@term_id}",
          "COMMENT=#{@comment}",
          "ACCEPT_KEYS=#{@accept_keys}",
          "NO_ROUTE=#{@no_route ? 1 : 0}",
          "RRN=#{@rrn}",
          "AMOUNT_ALL=#{@amount_all}"
        ]
      end
    end
  end
end
