module Rubyplat
  module Requests
    class PaymentPermission
      InvalidPaytool = Class.new(StandardError)

      # @param params [Hash] arguments to create request
      # @option params [String] :sender sender of request
      # @option params [String] :receiver request receiver
      # @option params [String] :operator operator
      # @option params [String] :date request date
      # @option params [String] :session session
      # @option params [String] :number phone number or payer's account number(can be blank)
      # @option params [String] :account payer's identifier or payees service identifier. Can be blank.
      # @option params [Float] :req_type if 1 -- simply check number without payment
      # @option params [Float] :amount amount to be payed. example: 1234.12
      # @option params [String] :term_id actual sender code(Only for MTS and Beeline)
      # @option params [Bool] :no_route auto redirect sign
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
        @pay_tool = Rubyplat::PAYTOOL.fetch(params[:pay_tool]) { raise InvalidPaytool.new("Paytool может принимать значения #{PAYTOOL.keys}") }
        @term_id = params[:term_id]
        @comment = params[:comment]
        @accept_keys = params[:accept_keys]
        @no_route = params[:no_route]
        @amount_all = params[:amount_all]
      end

      # @return [String] String representation of request
      # @example
      #   @check_request = Rubyplat::Requests::Check.new(
      #     sender: 'sender',
      #     receiver: 'receiver',
      #     operator: 'operator',
      #     date: Time.now,
      #     session: 'sess',
      #     account: 'account',
      #     amount: 1234.42,
      #     req_type: false,
      #     term_id: '12345',
      #     comment: 'FooBar',
      #     accept_keys: '12345',
      #     pay_tool: :cash,
      #     no_route: true)
      #
      #   @check_request.body
      #    #=> "SD=sender\r\nAP=receiver\r\nOP=operator\r\nDATE=2018.04.27 17:08:49\r\nSESSION=sess\r\nACCOUNT=account\r\nAMOUNT=1234.42\r\nREQ_TYPE=0\r\nPAY_TOOL=0\r\nTERM_ID=12345\r\nCOMMENT=FooBar\r\nACCEPT_KEYS=12345\r\nNO_ROUTE=1"
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
          @term_id && "TERM_ID=#{@term_id}",
          "COMMENT=#{@comment}",
          "ACCEPT_KEYS=#{@accept_keys}",
          "NO_ROUTE=#{@no_route ? 1 : 0}",
          "AMOUNT_ALL=#{@amount_all}"
        ]
      end
    end
  end
end
