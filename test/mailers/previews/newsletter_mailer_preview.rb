# Preview all emails at http://localhost:3000/rails/mailers/newsletter_mailer
class NewsletterMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/newsletter_mailer/new_collection
  def new_collection
    user = Newsletter.all.first
    NewsletterMailer.new_collection(
      email_subject_line: 'Fully Automated Email',
      campaign_title: 'fully-automated-email',
      list_type: 'test'
    )
  end

end
