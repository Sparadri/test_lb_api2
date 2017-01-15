require 'test_helper'

class NewsletterMailerTest < ActionMailer::TestCase
  test "new_collection" do
    mail = NewsletterMailer.new_collection
    assert_equal "New collection", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
