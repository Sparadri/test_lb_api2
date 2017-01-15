class NewsletterMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.new_collection.subject

  def new_collection(args = {})
    # fixed parameters
    @gibbon         = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
    @html_file_name = __method__.to_s
    @template_id    = 52823

    @collection = args[:collection]

    # custom parameters to build the campaign
    @email_subject_line = args[:email_subject_line] || 'hey look it up'
    @campaign_title     = args[:campaign_title] || 'New Collection from Adrien test'
    @list_type          = args[:list_type] || 'test'

    # methods to send the campaign
    set_list_id
    build_campaign
    persist_campaign
    build_template
    persist_template
    send_campaign
  end
end

# in recipients, segments can be specified
# from: https://gist.github.com/apeckham/878af9e52551bfcc1a19
# to do: build UTM

# for schedules emailing
# in body > schedule_time: "2016-06-27 20:00:00"
# gibbon.campaigns(campaign_id).actions.schedule.create(body: body)
# test mailing list should be a segment or a new mailing list?
# reply_to > currently we only have 1 email address? collection@le_barda.com? more? hello@lebarda.com


# rationale: 1 email batch sent, 1 campaign???
# possible to have multiple lists (at least 2? lebarda test and ALL?)


# question: what's better? nested methods call or list method?


# to do: check more options
# check how to create jobs to perform the action because takes long time

# not to play too much with ashes, wouldn't it be better to create a mailing database to keep track of everyhting????
