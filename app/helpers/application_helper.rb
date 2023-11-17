# frozen_string_literal: true

module ApplicationHelper
  APP_NAME = 'mini-app'

  def formatted_title(title = nil)
    return APP_NAME if title.nil?

    "#{APP_NAME} - #{title}"
  end

  def signed_in?
    return true unless session[:user_id].nil?
    false
  end

  def oauth_provider
    session[:provider]
  end

  def current_user_id
    session[:user_id]
  end

  def current_user_email
    session[:user_email]
  end
end
