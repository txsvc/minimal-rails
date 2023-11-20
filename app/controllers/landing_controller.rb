# frozen_string_literal: true

# Stuff shown to anoymous users
class LandingController < ApplicationController
  # before_action :authenticate_account!

  def index
    redirect_to '/dashboard' if account_signed_in?
  end
end
