require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "create_edit_order" do
    mail = UserMailer.create_edit_order
    assert_equal "Create edit order", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
