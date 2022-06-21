class Admin::DiaryCommentsController < ApplicationController
  def index
    @reports = Report.all
  end

  def destroy
    report = Report.find_by(params[:diary_comment_id])
    @destroy_comment = report.diary_comment
    if @destroy_comment.destroy
      redirect_to admin_diary_comments_path
      flash[:notice] = "通報コメントを削除しました"
    end
  end
end
