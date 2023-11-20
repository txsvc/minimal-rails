# frozen_string_literal: true

module Error
  # Handle application errors in a central place
  class AppError < StandardError
    attr_reader :status, :error, :message

    def initialize(err = nil, status = nil, message = nil)
      super()
      @error = err || :unprocessable_entity
      @status = status || 500
      @message = message || 'something went wrong'
    end
  end
end
