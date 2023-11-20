# frozen_string_literal: true

# ApplicationController provides generic behaviour
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Error::ErrorHandler

  # enforce parameters
  ActionController::Parameters.action_on_unpermitted_parameters = :raise

  def authenticate_account!
    redirect_to login_path unless account_signed_in?
  end

  def account_signed_in?
    return true unless session[:user_id].nil?

    false
  end

  rescue_from ActionController::UnknownFormat, ActionView::MissingTemplate do
    respond_to_error(:not_found, 500, 'not found')
  end
end
