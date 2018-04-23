require "test_helper"

class Rubyplat::CheckTest < Minitest::Test
  def test_it_renders_fields
    check_request = Rubyplat::Requests::Check.new(
      sender: 'sender',
      receiver: 'receiver',
      operator: 'operator',
      date: Time.now,
      session: 'sess')

    assert check_request.body.include?('SD=sender')
  end
end
