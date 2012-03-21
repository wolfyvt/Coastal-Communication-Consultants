require 'test_helper'

class InfoRequestConfirmationTest < ActionMailer::TestCase
  test "requested" do
    mail = InfoRequestConfirmation.requested
    assert_equal "Requested", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
