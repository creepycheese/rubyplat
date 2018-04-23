require "test_helper"

class Rubyplat::CheckTest < Minitest::Test
  def setup
    @check_request = Rubyplat::Requests::Check.new(
      sender: 'sender',
      receiver: 'receiver',
      operator: 'operator',
      date: Time.now,
      session: 'sess')
  end

  def test_it_renders_sender
    assert @check_request.body.include?('SD=sender')
  end

  def test_it_renders_receiver
    assert @check_request.body.include?('AP=receiver')
  end

  def test_it_renders_operator
    assert @check_request.body.include?('OP=operator')
  end

  def test_it_renders_date
    assert @check_request.body.include?('DATE=')
  end

  def test_it_renders_session
    assert @check_request.body.include?('SESSION=sess')
  end
end
