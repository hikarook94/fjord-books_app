# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  
  def configure_permitted_parameters
    user_params = [:user_name, :email, :password, :password_confirmation, :postal_code, :address, :intro]
    devise_parameter_sanitizer.permit(:sign_up, keys: user_params)
    devise_parameter_sanitizer.permit(:account_update, keys: user_params)
  end
end
