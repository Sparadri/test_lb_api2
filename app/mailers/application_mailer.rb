class ApplicationMailer < ActionMailer::Base
  # default from: "adrien.de.villoutreys@gmail.com"
  #layout 'newsletter_mailer'

  private

  def set_list_id
    @list_type == 'test' ? @list_id = ENV['MAILCHIMP_LIST_ID'] : nil
  end

  # args: campaign_title,
  def build_campaign
    recipients = {
      list_id: @list_id
    }

    settings = {
      subject_line: @email_subject_line,
      title: @campaign_title,
      from_name: 'Adrien',
      reply_to: 'adrien.de.villoutreys@gmail.com'
    }

    @body_campaign = {
      type: 'regular',
      recipients: recipients,
      settings: settings
    }
  end

  def persist_campaign
    campaign = @gibbon.campaigns.create(body: @body_campaign)
    @campaign_id = campaign['id']
  end

  def build_template
    html_file      = File.read("#{Rails.root}/app/views/newsletter_mailer/#{@html_file_name}.html.erb")
    html_template  = ERB.new(html_file).result( binding )
    @body_template = {
      template: {
        id: @template_id,
        sections: {
          'template_html': html_template
        }
      }
    }
  end

  def persist_template
    @gibbon.campaigns(@campaign_id).content.upsert(body: @body_template)
  end

  def send_campaign
    @gibbon.campaigns(@campaign_id).actions.send.create
  end

end
