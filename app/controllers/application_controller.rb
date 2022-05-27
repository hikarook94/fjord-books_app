# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    sign_up_params = %i[user_name email password password_confirmation]
    update_params = %i[user_name email password password_confirmation postal_code address intro]
    devise_parameter_sanitizer.permit(:sign_up, keys: sign_up_params)
    devise_parameter_sanitizer.permit(:account_update, keys: update_params)
  end
end
