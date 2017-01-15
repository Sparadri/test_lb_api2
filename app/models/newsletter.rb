class Newsletter < ActiveRecord::Base

  validates :email, presence: :true
  after_create :subscribe_to_newsletter

  private

  def subscribe_to_newsletter
    SubscribeToNewsletterService.new(self).add_to_mailchimp
  end

end


# recipients = {
#   list_id: list_id,
#   segment_opts: {
#     saved_segment_id: segment_id
#   }
# }
# settings = {
#   subject_line: "Subject Line",
#   title: "Name of Campaign",
#   from_name: "From Name",
#   reply_to: "my@email.com"
# }

# body = {
#   type: "regular",
#   recipients: recipients,
#   settings: settings
# }

# begin
#   gibbon.campaigns.create(body: body)
# rescue Gibbon::MailChimpError => e
#   puts "Houston, we have a problem: #{e.message} - #{e.raw_body}"
# end



# Get all campaigns:
# campaigns = gibbon.campaigns.retrieve

# Fetch the number of opens for a campaign
# email_stats = gibbon.reports(campaign_id).retrieve["opens"]


# You can also unsubscribe a member from a list:
# gibbon.lists(list_id).members(lower_case_md5_hashed_email_address).update(body: { status: "unsubscribed" })
