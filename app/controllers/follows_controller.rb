# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    user = User.find(params[:followee_id])
    current_user.follow(params[:followee_id])
    redirect_to user_path(user)
  end

  def destroy
    user = User.find(params[:followee_id])
    current_user.unfollow(params[:id])
    redirect_to user_path(user)
  end
end
