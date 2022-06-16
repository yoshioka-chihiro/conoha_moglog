class Public::ReportsController < ApplicationController

  def create
    @diary_report = Report.new(end_user_id: current_end_user.id, diary_comment_id: params[:diary_comment_id])
    @diary_report.save
    redirect_to diary_path(params[:diary_id])
  end


  def destroy
    @diary_report = Report.find_by(end_user_id: current_end_user.id, diary_comment_id: params[:diary_comment_id])
    @diary_report.destroy
    redirect_to diary_path(params[:diary_id])
  end

end
