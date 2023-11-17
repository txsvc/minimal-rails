# frozen_string_literal: true

module Error
  module ErrorHandler
    def self.included(clazz)
      clazz.class_eval do
        # mini-app does not use ActiveRecord
        # rescue_from ActiveRecord::RecordNotFound do |_e|
        #  respond_to_error(:record_not_found, 500, 'record not found')
        # end

        rescue_from AppError do |e|
          respond_to_error(e.error, e.status, e.message)
        end
      end
    end

    private

    def respond_to_error(err, status, message)
      if Rails.env.production?
        # FIXME: report the error first
        redirect_to '/'
      else
        et = "+++ #{err}, #{status}, #{message} +++"
        render plain: et, status: status, content_type: 'text/plain'
      end
    end
  end
end
