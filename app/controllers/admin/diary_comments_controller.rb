class Admin::DiaryCommentsController < ApplicationController
  def index
    @reports = Report.all
  end

  def show
     @diary_comment = DiaryComment.find(params[:id])
  end

  def edit
    @diary_comment = DiaryComment.find(params[:id])
  end

  def destroy
    report = Report.find_by(params[:diary_comment_id])
    @destroy_comment = report.diary_comment
    if @destroy_comment.destroy
      redirect_to admin_diary_comments_path
      flash[:notice] = "コメントを削除"
    end
  end
end
