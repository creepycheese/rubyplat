class CheckResponseTest < Minitest::Test
  def setup
    fixture_path =  File.expand_path '../../fixtures/response.text', __FILE__
    @response_ok = File.read(fixture_path)
  end

  def test_it_parses_response
    @response = Rubyplat::Responses::CheckResponse.from_response_string(@response_ok)
    assert_equal 0, @response.result.to_i
  end

  def test_it_should_be_success
    @response = Rubyplat::Responses::CheckResponse.from_response_string(@response_ok)
    assert @response.success?
  end
end
