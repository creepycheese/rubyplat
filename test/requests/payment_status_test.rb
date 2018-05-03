require "test_helper"

class Rubyplat::PaymentStatusTest < Minitest::Test
  def setup
    @check_request = Rubyplat::Requests::PaymentStatus.new(
      session: 123123213,
      accept_keys: 1231321,
      transid: 2222)
  end

  def test_it_renders_session
    assert @check_request.body.include?('SESSION=123123213')
  end

  def test_it_renders_accept_keys
    assert @check_request.body.include?('ACCEPT_KEYS=1231321')
  end

  def test_it_renders_trans_id
    assert @check_request.body.include?('TRANSID=2222')
  end
end
