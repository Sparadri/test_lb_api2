# current user information
json.current_user do
  json.partial! partial: './api/v1/shared/current_user', locals: { current_user: @current_user }
end

json.collectioners do
  @collectioners.each do |collectioner|
    json.set! collectioner.id.to_s.to_sym do
      json.partial! partial: './api/v1/shared/collectioner', locals: { collectioner: collectioner }
    end
  end
end

