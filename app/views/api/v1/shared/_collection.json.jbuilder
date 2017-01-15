# json.collection do
#   json.id              collection.id
#   json.is_live         collection.is_live
#   json.title           collection.title
#   json.color_dark      collection.color_dark
#   json.color_light     collection.color_light
#   json.created_at      collection.created_at
#   json.updated_at      collection.updated_at
# end

json.id              collection.id
json.is_live         collection.is_live
json.title           collection.title
json.created_at      collection.created_at

json.style do
  json.color_dark      collection.color_dark
  json.color_light     collection.color_light
end

json.pictures do
  json.main_cover_picture      collection.main_cover_picture
  json.profile_picture         collection.profile_picture
  json.interview_cover_picture collection.interview_cover_picture
end
