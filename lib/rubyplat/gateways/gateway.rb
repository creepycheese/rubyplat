module Rubyplat
  module Gateways
    # Represents payment gateway for performing operations
    #
    class Gateway
      def self.available
        @available ||= [
          ::Rubyplat::Gateways::Gateway.new(
            'Тройка (Московский Метрополитен и Мосгортранс)',
            3589,
            'https://service.cyberplat.ru/cgi-bin/tc/tc_pay_check.cgi/3589',
            'https://service.cyberplat.ru/cgi-bin/tc/tc_pay.cgi/3589',
            'https://service.cyberplat.ru/cgi-bin/tc/tc_pay_status.cgi'
          )
        ]
      end

      attr_reader :name, :number, :pay_check_uri, :pay_status_uri, :pay_uri

      def initialize(name, number, pay_check_uri, pay_uri, pay_status_uri)
        @name = name
        @number = number
        @pay_check_uri = URI(pay_check_uri)
        @pay_uri = URI(pay_uri)
        @pay_status_uri = URI(pay_status_uri)
      end
    end
  end
end
