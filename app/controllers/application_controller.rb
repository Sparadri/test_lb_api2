class ApplicationController < ActionController::API

  # includes protect from forgery class
  include ActionController::RequestForgeryProtection
  protect_from_forgery with: :null_session


  include DeviseTokenAuth::Concerns::SetUserByToken
  # before_action :verify_api_key
  # before_action :authenticate_api_v1_user!
  before_action :hce
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  respond_to :json

  def hce
    p 'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo'
    p current_user
    p request.headers
    p 'oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo'
  end


  private

  def verify_api_key
    # api key to be put in application.yml for secret
    if request.headers["HTTP_X_WEB_TOKEN"] != "lebardaweb"
      render json: {
        error: "Unauthorized API Connection. Please Contact Le Barda."
      }, status: :unauthorized
    end
  end
end
