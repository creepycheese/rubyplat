class CheckBalanceResponseTest < Minitest::Test
  def setup
    fixture_path =  File.expand_path '../../fixtures/check_balance_response.text', __FILE__
    @response_ok = File.read(fixture_path).gsub("\n", "\r\n")
  end

  def test_it_parses_rest
    @response = Rubyplat::Responses::CheckBalanceResponse.from_response_string(@response_ok)
    assert_equal 1077342.43, @response.rest_limit
  end

  def test_it_parses_daily_limit
    @response = Rubyplat::Responses::CheckBalanceResponse.from_response_string(@response_ok)
    assert_equal 200000.00, @response.daily_limit
  end

  def test_it_parses_available_limit
    @response = Rubyplat::Responses::CheckBalanceResponse.from_response_string(@response_ok)
    assert_equal 77342.43, @response.available_limit
  end

  def test_it_parses_max_payment_limit
    @response = Rubyplat::Responses::CheckBalanceResponse.from_response_string(@response_ok)
    assert_equal 30000.00, @response.max_payment_limit
  end
end
