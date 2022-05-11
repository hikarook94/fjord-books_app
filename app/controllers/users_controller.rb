# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.order(:id).page(params[:page])
  end

  def show; end

  def edit; end

  def update; end

  def destroy; end

  private

  # # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end
end
