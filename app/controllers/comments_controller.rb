# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_commentable, only: %i[create]

  def create
    @comment = @commentable.comments.new(report_params)
    @comment.user = current_user
    @comment.save
    redirect_to @commentable
  end

  private

  def set_commentable
    @commentable = if params.key?(:report_id)
                     Report.find(params[:report_id])
                   elsif params.key?(:book_id)
                     Book.find(params[:book_id])
                   end
  end

  def report_params
    params.require(:comment).permit(:text)
  end
end
