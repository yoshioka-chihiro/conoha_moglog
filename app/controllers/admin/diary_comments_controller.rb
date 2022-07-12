class Admin::DiaryCommentsController < ApplicationController

  def index
    # 通報コメントを取得
    @reports = Report.all
  end

  def destroy
    # 対象の通報コメントからコメントIDを取得
    report = Report.find_by(params[:diary_comment_id])
    # 削除コメントに指定
    @destroy_comment = report.diary_comment
    if @destroy_comment.destroy
      redirect_to admin_diary_comments_path
      flash[:notice] = "通報コメントを削除しました"
    end
  end

end
