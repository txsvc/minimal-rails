# frozen_string_literal: true

# The user's settings etc
class ProfileController < ApplicationController
  before_action :authenticate_account!

  def index; end
end
