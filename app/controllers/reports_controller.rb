# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]

  def index
    @reports = Report.order(:id).page(params[:page])
  end

  def show
    @report = Report.find(params[:id])
    @comments = @report.comments.includes(:user).all
    @comment = @report.comments.new
  end

  def new
    @report = Report.new
  end

  def edit; end

  def create
    @report = current_user.reports.new(report_params)
    @report.save
    redirect_to @report, notice: t('controllers.common.notice_create', name: Report.model_name.human)
  end

  def update
    @report.update(report_params)
    redirect_to @report, notice: t('controllers.common.notice_update', name: Report.model_name.human)
  end

  def destroy
    @report.destroy
    redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: Report.model_name.human)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def report_params
    params.require(:report).permit(:title, :text)
  end
end
