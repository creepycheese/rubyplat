class RefillInfoResponseTest < Minitest::Test
  def setup
    fixture_path =  File.expand_path '../../fixtures/refill_info_response.txt', __FILE__
    @response_ok = File.read(fixture_path)
  end

  def test_it_parses_response
    @response = Rubyplat::Responses::RefillInfoResponse.from_response_string(@response_ok)
    assert_equal 0, @response.result.to_i
  end

  def test_it_sum_all
    @response = Rubyplat::Responses::RefillInfoResponse.from_response_string(@response_ok)
    assert_equal 3.to_s, @response.sum_all
  end
end
