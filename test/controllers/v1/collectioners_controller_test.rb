require 'rest-client'
# require 'json'

# RestClient.get(url, headers={})
# RestClient.post(url, payload, headers={})

header          = {content_type: :json, :accept => :json, X_User_Email: 'me@me.com', X_User_Token: 'BDuv6WU2W1jbB6FosyTq'}
local_url       = 'http://localhost:3000'
api_version_url = '/api/v1/'
route           = 'collectioners/'


# GET show collectioners
# controller: api/v1/collectioners#show
url    = "#{local_url}#{api_version_url}#{route}1"
p RestClient.get( url, header )


# GET all collectioners
# controller: api/v1/collectioners#index
route  = 'collectioners/'
url    = "#{local_url}#{api_version_url}#{route}"
p RestClient.get( url, header )


# POST new collection
# controller: api/v1/collectioners#create
route  = 'collectioners/'
url    = "#{local_url}#{api_version_url}#{route}"
body   = {collection: {title: "maillane", is_live: true}}
p RestClient.post( url, body, header )

# PATCH new collection
# controller: api/v1/collectioners#update
route  = 'collectioners/'
url    = "#{local_url}#{api_version_url}#{route}1"
body   = {collection: {title: "new name", is_live: true}}
p RestClient.patch( url, body, header )
