
# current user information
json.current_user do
  json.partial! partial: './api/v1/shared/current_user', locals: { current_user: @current_user }
end

json.collections do

  @filtered_collections.each do |collection|
    json.set! collection.id.to_s.to_sym do

      json.details do
        json.partial! partial: './api/v1/shared/collection', locals: { collection: collection }
      end

      json.interviews do
        collection.interviews.each do |interview|
          json.set! interview.id.to_s.to_sym do
            json.partial! partial: './api/v1/shared/interview', locals: { interview: interview }
          end
        end
      end

      json.collectioner do
        json.partial! partial: './api/v1/shared/collectioner', locals: { collectioner: collection.collectioner }
      end

    end
  end
end
