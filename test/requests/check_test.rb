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

  def test_it_does_not_render_number_when_not_present
    refute @check_request.body.include?('NUMBER=333')
  end

  def test_it_renders_number_when_present
    @check_request = Rubyplat::Requests::Check.new(
      sender: 'sender',
      receiver: 'receiver',
      operator: 'operator',
      date: Time.now,
      session: 'sess',
      number: 333)

    assert @check_request.body.include?('NUMBER=333')
  end
end
