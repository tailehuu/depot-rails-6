require "test_helper"

class SupportMailboxTest < ActionMailbox::TestCase
  test "we create a SupportRequest when we get a support email" do
    receive_inbound_email_from_mail(
      to: 'support@example.com',
      from: 'chris@somewhere.net',
      subject: "Need help",
      body: "I can't figure out how to check out!"
    )

    support_request = SupportRequest.last
    assert_equal  support_request.email,    'chris@somewhere.net'
    assert_equal  support_request.subject,  'Need help'
    assert_equal  support_request.body,     "I can't figure out how to check out!"
    assert_nil    support_request.order
  end

  test "we create a SupportRequest with the most recent order" do
    recent_order = orders(:one)

    receive_inbound_email_from_mail(
      to: 'support@example.com',
      from: recent_order.email,
      subject: "Need help",
      body: "I can't figure out how to check out!"
    )

    support_request = SupportRequest.last
    assert_equal  support_request.email,    recent_order.email
    assert_equal  support_request.subject,  'Need help'
    assert_equal  support_request.body,     "I can't figure out how to check out!"
    assert_equal  support_request.order,    recent_order
  end
end
