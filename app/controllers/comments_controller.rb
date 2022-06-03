# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_commentable, only: %i[create]

  def create
    @comment = @commentable.comments.new(report_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to @commentable
  end

  private

  def set_commentable
    @commentable = params.key?(:report_id) ? Report.find(params[:report_id]) : Book.find(params[:book_id])
  end

  def report_params
    params.require(:comment).permit(:text)
  end
end
