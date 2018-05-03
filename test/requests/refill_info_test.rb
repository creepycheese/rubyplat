require "test_helper"

class Rubyplat::RefillInfoTest < Minitest::Test
  def setup
    @check_request = Rubyplat::Requests::RefillInfo.new(
      session: 123123213,
      accept_keys: 1231321,
      on_date: Date.parse('24/11/2014')
    )

  end

  def test_it_renders_session
    assert @check_request.body.include?('SESSION=123123213')
  end

  def test_it_renders_accept_keys
    assert @check_request.body.include?('ACCEPT_KEYS=1231321')
  end

  def test_it_renders_on_date
    assert @check_request.body.include?('ON_DATE=20141124')
  end
end
