require 'rest-client'
# localhost:3000/api/v1/collections?user_email=me@me.com&user_token=iYMqCyjhmLTszJY7C-oF

# require 'json'

# RestClient.get(url, headers={})
# RestClient.post(url, payload, headers={})

header          = {content_type: :json, :accept => :json, X_User_Email: 'me@me.com', X_User_Token: 'BDuv6WU2W1jbB6FosyTq'}
local_url       = 'http://localhost:3000'
api_version_url = '/api/v1/'
route           = 'products/'



# GET show products
# controller: api/v1/products#show
url    = "#{local_url}#{api_version_url}#{route}1"
p RestClient.get( url, header )


# GET all products
# controller: api/v1/products#index
url    = "#{local_url}#{api_version_url}#{route}"
p RestClient.get( url, header )


# POST new collection
# controller: api/v1/products#create
url    = "#{local_url}#{api_version_url}#{route}"
body   = {collection: {title: "maillane", is_live: true}}
p RestClient.post( url, body, header )

# PATCH new collection
# controller: api/v1/products#update
url    = "#{local_url}#{api_version_url}#{route}1"
body   = {collection: {title: "new name", is_live: true}}
p RestClient.patch( url, body, header )

# curl -i -X POST                                        \
#        -H 'Content-Type: application/json'              \
#        -H 'X-User-Email: me@me.com'               \
#        -H 'X-User-Token: xsTSx_t8qKonzeJYizCs'          \
#        -d '{ "collection": { "title": "New name" } }'    \
#        http://localhost:3000/api/v1/products/1       \
