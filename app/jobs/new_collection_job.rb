class NewCollectionJob < ActiveJob::Base
  # configure queues in sidekiq.yml
  queue_as :default

  # IMPORTANT: to test sidekiq, needs to re-run the server when method updated!!! otherwise, not taken into account
  # IMPORTANT: Arguments will be serialized to json, so pass id, string, not full objects.
  def perform(args = {})
    # building the newsletter with the collection_id
    campaign_information = args[:details]
    campaign_information[:collection] = Collection.find(args[:id])

    NewsletterMailer.new_collection(campaign_information).deliver_now
  end
end
