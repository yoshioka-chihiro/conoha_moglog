class Admin::DiaryCommentsController < ApplicationController
  def index
    @diary_comments = DiaryComment.all
  end

  def show
     @diary_comment = DiaryComment.find(params[:id])
  end

  def edit
    @diary_comment = DiaryComment.find(params[:id])
  end
  
  def destroy
    DiaryComment.find(params[:id]).destroy
    flash[:notice] = "コメントを削除"
  end
end
