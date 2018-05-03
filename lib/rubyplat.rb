require "rubyplat/version"
require 'date'
require_relative 'rubyplat/utils/parser'

require_relative 'rubyplat/requests/payment_permission'
require_relative 'rubyplat/requests/payment_request'
require_relative 'rubyplat/requests/payment_status'
require_relative 'rubyplat/requests/check_balance'

require_relative 'rubyplat/responses/response'
require_relative 'rubyplat/responses/payment_permission_response'
require_relative 'rubyplat/responses/payment_response'
require_relative 'rubyplat/responses/payment_status_response'
require_relative 'rubyplat/responses/check_balance_response'

module Rubyplat
  InvalidPaytool = Class.new(StandardError)
  PAYTOOL = {
    cash: 0,
    local_card: 1,
    foreign_card: 2
  }
end
