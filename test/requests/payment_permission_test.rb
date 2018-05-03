require "test_helper"

class Rubyplat::PaymentPermissionTest < Minitest::Test
  def setup
    @check_request = Rubyplat::Requests::PaymentPermission.new(
      sender: 'sender',
      receiver: 'receiver',
      operator: 'operator',
      date: Time.now,
      session: 'sess',
      account: 'account',
      amount: 1234.42,
      amount_all: 1234.11,
      req_type: false,
      term_id: '12345',
      comment: 'FooBar',
      accept_keys: '12345',
      pay_tool: :cash,
      no_route: true)
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
    @check_request = Rubyplat::Requests::PaymentPermission.new(
      sender: 'sender',
      receiver: 'receiver',
      operator: 'operator',
      date: Time.now,
      session: 'sess',
      number: 333,
      pay_tool: :cash)

    assert @check_request.body.include?('NUMBER=333')
  end

  def test_it_renders_account_when_given
    assert @check_request.body.include?('ACCOUNT=account')
  end

  def test_it_renders_amount
    assert @check_request.body.include?('AMOUNT=1234.42')
  end

  def test_it_renders_req_type_zero_when_false
    assert @check_request.body.include?('REQ_TYPE=0')
  end

  def test_it_renders_req_type_to_one_when_true
    @check_request = Rubyplat::Requests::PaymentPermission.new(
      sender: 'sender',
      receiver: 'receiver',
      operator: 'operator',
      date: Time.now,
      session: 'sess',
      account: 'account',
      amount: 1234.42,
      req_type: true,
      pay_tool: :cash)

    assert @check_request.body.include?('REQ_TYPE=1')
  end

  def test_it_renders_paytool_for_local_card
    @check_request = Rubyplat::Requests::PaymentPermission.new(
      sender: 'sender',
      receiver: 'receiver',
      operator: 'operator',
      date: Time.now,
      session: 'sess',
      account: 'account',
      amount: 1234.42,
      req_type: false,
      pay_tool: :local_card)

    assert @check_request.body.include?('PAY_TOOL=1')
  end

  def test_it_renders_term_id
    assert @check_request.body.include?('TERM_ID=12345')
  end

  def test_it_renders_cooment
    assert @check_request.body.include?('COMMENT=FooBar')
  end

  def test_it_renders_accept_keys
    assert @check_request.body.include?('ACCEPT_KEYS=12345')
  end

  def test_it_renders_no_route
    assert @check_request.body.include?('NO_ROUTE=1')
  end

  def test_it_redners_amount_all
    assert @check_request.body.include?('AMOUNT_ALL=1234.11')
  end
end
