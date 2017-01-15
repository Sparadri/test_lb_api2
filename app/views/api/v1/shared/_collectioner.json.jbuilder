json.id             collectioner.id

json.first_name     collectioner.first_name
json.last_name      collectioner.last_name
json.email          collectioner.email

json.facebook_url   collectioner.facebook_url
json.twitter_url    collectioner.twitter_url
json.instagram_url  collectioner.instagram_url
json.pinterest_url  collectioner.pinterest_url

json.created_at     collectioner.created_at

json.nb_products collectioner.products.where(is_live: true).length
