# frozen_string_literal: true

class SessionsController < ApplicationController
  def index; end

  def create_github
    auth_hash = request.env['omniauth.auth']
    email = auth_hash.info['email']
    uid = auth_hash.uid

    session[:user_id] = uid
    session[:user_email] = email
    session[:provider] = 'github'
    redirect_to dashboard_path
  end

  def create_google
    auth_hash = request.env['omniauth.auth']
    email = auth_hash.info['email']
    uid = auth_hash.uid

    session[:user_id] = uid
    session[:user_email] = email
    session[:provider] = 'google'
    redirect_to dashboard_path
  end

  def create_discord
    auth_hash = request.env['omniauth.auth']
    email = auth_hash.info['email']
    uid = auth_hash.uid

    session[:user_id] = uid
    session[:user_email] = email
    session[:provider] = 'discord'
    redirect_to dashboard_path
  end

  def logout
    session[:user_id] = nil
    session[:user_email] = nil
    session[:provider] = nil

    redirect_to root_path
  end
end
