class Public::DiaryCommentsController < ApplicationController
  before_action :authenticate_end_user!
  

  def create
    # コメントをする対象の投稿のインスタンスを作成
    @diary = Diary.find(params[:diary_id])
    #投稿に紐づいたコメントを作成
    @diary_comment = @diary.diary_comments.new(diary_comment_params)
    # コメント投稿者(end_user)のidを代入
    @diary_comment.end_user_id = current_end_user.id
    if @diary_comment.save
      @diary_comments = @diary.diary_comments
      flash[:notice] = "コメントを投稿しました！"
      render :index
    else
      flash[:notice] = "コメントを入れてください！"
      @diary = Diary.find(params[:diary_id])
      redirect_to diary_path(@diary)
    end
  end

   def destroy
    @diary = Diary.find(params[:diary_id])
    @diary_comment = DiaryComment.find(params[:id])
    @diary_comment.destroy
    @diary_comments = @diary.diary_comments
    render :index
   end

  private

  def diary_comment_params
    params.require(:diary_comment).permit(:comment)
  end
end
