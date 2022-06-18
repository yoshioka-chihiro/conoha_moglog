class Public::DiariesController < ApplicationController
  def index
    @diary = Diary.new
    @diaries = Diary.all
  end

  def show
    @diary = Diary.find(params[:id])
    @diary_comment = DiaryComment.new
    @diary_comment.end_user_id = current_end_user.id
    @diary_comments = @diary.diary_comments
  end

  def personal_index
    @diary_user = EndUser.find(params[:id])
    @diaries = Diary.where(end_user_id: @diary_user.id)
    @recent_weight = Weight.where(end_user_id: @diary_user.id).order(record_day: :asc).last
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.end_user_id = current_end_user.id
    if @diary.save
      redirect_to diaries_path, notice: "日記を投稿しました！"
    else
      @diaries = Diary.all
      render :index, alert: "投稿できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
    end
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
      flash[:notice] = "日記を更新しました。"
      redirect_to diary_path(@diary)
    else
      flash[:alret] = "更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    @diary = Diary.find(params[:id])
    if @diary.destroy
      flash[:notice] = "日記を削除しました"
      @diaries = Diary.all
      redirect_to diaries_path
    else
      render :index
    end
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :body)
  end

end
