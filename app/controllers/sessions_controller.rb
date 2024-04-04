# frozen_string_literal: true

# SessionsController handles sign-in & sign-out etc.
class SessionsController < ApplicationController
  def index; end

  def create_github
    auth_hash = request.env['omniauth.auth']
    email = auth_hash.info['email']
    uid = auth_hash.uid

    auth = authentciate_client email
    redirect_to root_path if auth.nil?

    create_session uid, email, auth['client_secret'], 'github'

    redirect_to dashboard_path
  end

  def create_google2
    auth_hash = request.env['omniauth.auth']
    email = auth_hash.info['email']
    uid = auth_hash.uid

    auth = authentciate_client email
    redirect_to root_path if auth.nil?

    create_session uid, email, auth['client_secret'], 'google'

    redirect_to dashboard_path
  end

  def create_google
    auth_hash = request.env['omniauth.auth']
    authenticate_client auth_hash, 'google'
  end

  def create_discord
    auth_hash = request.env['omniauth.auth']
    email = auth_hash.info['email']
    uid = auth_hash.uid

    auth = authentciate_client email
    redirect_to root_path if auth.nil?

    create_session uid, email, auth['client_secret'], 'discord'

    redirect_to dashboard_path
  end

  def logout
    AuthenticationService.revoke_client session[:user_email] # FIXME: check response?
    # delete the session anyways ...
    session[:user_id] = nil
    session[:user_email] = nil
    session[:provider] = nil
    session[:client_secret] = nil

    redirect_to root_path
  end

  private

  def authenticate_client(auth_hash, provider)
    email = auth_hash.info['email']
    uid = auth_hash.uid

    auth = register_client email
    redirect_to root_path if auth.nil?

    create_session uid, email, auth['client_secret'], provider

    redirect_to dashboard_path
  end

  def register_client(email)
    auth = Authentication.new
    auth.client_id = "#{ENV.fetch('PROJECT_ID', 'default')}.#{email}"

    AuthenticationService.register_client auth
  end

  def create_session(uid, email, secret, provider)
    session[:user_id] = uid
    session[:user_email] = email
    session[:client_secret] = secret
    session[:provider] = provider
  end
end
