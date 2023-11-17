# frozen_string_literal: true

class LandingController < ApplicationController
  # before_action :authenticate_account!

  def index
    redirect_to '/dashboard' if account_signed_in?
  end
end
