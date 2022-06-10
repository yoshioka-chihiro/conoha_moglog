class Public::DiaryCommentsController < ApplicationController

  def create
    # コメントをする対象の投稿のインスタンスを作成
    @diary = Diary.find(params[:diary_id])
    #投稿に紐づいたコメントを作成
    @diary_comment = @diary.diary_comments.new(diary_comment_params)
    # コメント投稿者(end_user)のidを代入
    @diary_comment.end_user_id = current_end_user.id
    @diary_comment.save
    redirect_to diary_path(@diary)
  end

   def destroy
    @diary = Diary.find(params[:diary_id])
    @diary_comment = DiaryComment.find(params[:id])
    @diary_comment.destroy
    redirect_to diary_path(@diary)
   end

  private

  def diary_comment_params
    params.require(:diary_comment).permit(:comment)
  end
end
