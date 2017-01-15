source 'https://rubygems.org'

# basic gems
gem 'rails', '4.2.5.1'
gem 'rails-api'

# api
gem 'pg'
gem 'pundit'
gem 'figaro'
gem 'redis'
gem 'jbuilder'

# features
gem 'will_paginate', '~> 3.1.0'
gem 'gibbon'

# sidekiq
gem 'sidekiq'
gem 'sidekiq-failures'
gem 'sinatra' # dependency sidekiq

# to be removed in production and put back in development group
gem 'faker'

# authentication
# gem 'devise'
gem 'devise_token_auth'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'

# authorising cross origin requests
gem 'rack-cors', :require => 'rack/cors'

group :development, :test do
  # enables http requests in ruby
  gem 'rest-client'

  gem 'binding_of_caller'
  gem 'better_errors'
  gem 'quiet_assets'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'spring'

  gem "letter_opener"
end

gem 'rails_12factor', group: :production


# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', :group => :development

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
