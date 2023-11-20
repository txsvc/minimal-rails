# frozen_string_literal: true

# Stuff shown after login
class DashboardController < ApplicationController
  before_action :authenticate_account!

  def index; end
end
