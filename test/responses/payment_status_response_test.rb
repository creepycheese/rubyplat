class PaymentStatusResponseTest < Minitest::Test
  def setup
    fixture_path =  File.expand_path '../../fixtures/payment_status_response.text', __FILE__
    @response_ok = File.read(fixture_path)
  end

  def test_it_parses_response
    @response = Rubyplat::Responses::PaymentStatusResponse.from_response_string(@response_ok)
    assert_equal 7, @response.result.to_i
  end

  def test_it_should_be_success
    @response = Rubyplat::Responses::PaymentStatusResponse.from_response_string(@response_ok)
    assert @response.success?
  end

  def test_it_should_be_completed
    @response = Rubyplat::Responses::PaymentStatusResponse.from_response_string(@response_ok)
    assert @response.completed?
  end
end
