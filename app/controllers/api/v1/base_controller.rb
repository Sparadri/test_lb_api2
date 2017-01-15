# app/controllers/api/v1/base_controller.rb
class Api::V1::BaseController < ApplicationController

  # disable the fallback by default when user does not provide login credentials
  # acts_as_token_authentication_handler_for User, fallback_to_devise: :exception
  # protect_from_forgery_with: :null_session

  # acts_as_token_authentication_handler_for User, fallback_to_devise: false
  # before_action :require_authentication!, only: [:create, :update]
  # before_action :set_user

  include Pundit

  # before_action :authenticate_user!, except: :index
  # pundit gateway > should be put in base / application controller
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  rescue_from StandardError,                with: :internal_server_error
  rescue_from Pundit::NotAuthorizedError,   with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def set_user
    @current_user = current_user
  end

  def user_not_authorized(exception)
    render json: {
      error: "Unauthorized #{exception.policy.class.to_s.underscore.camelize}.#{exception.query}"
    }, status: :unauthorized
  end

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def internal_server_error(exception)
    if Rails.env.development?
      response = { type: exception.class.to_s, error: exception.message }
    else
      response = { error: "Internal Server Error" }
    end
    render json: response, status: :internal_server_error
  end
end
