# frozen_string_literal: true

class Authentication
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :client_id, :string
  attribute :client_secret, :string
  attribute :expires, :integer
  attribute :roles, :string

  def set_defaults
    @expires = 0
    # permitted[:repetition_penalty] = 1.15
    # permitted[:num_beams] = 1
    # permitted[:do_sample] = false
    # permitted[:top_p] = 1.0
    # permitted[:top_k] = 50
    # permitted[:skip_prompt] = true
  end
end
