# frozen_string_literal: true

class Users::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    sign_up_params = %i[user_name email password password_confirmation]
    update_params = %i[user_name email password password_confirmation postal_code address intro]
    super
    permit(:sign_up, keys: sign_up_params)
    permit(:account_update, keys: update_params)
  end
end
