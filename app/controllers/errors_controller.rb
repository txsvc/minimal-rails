# frozen_string_literal: true

# Gracefully handle errors
class ErrorsController < ApplicationController
  protect_from_forgery with: :null_session
  include Error::ErrorHandler

  def page_not_found
    respond_to_error(:page_not_found, 404, 'not found')
  end
end
