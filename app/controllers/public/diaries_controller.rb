class Public::DiariesController < ApplicationController
  before_action :authenticate_end_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]


  def index
    @diary = Diary.new
    @diaries = Diary.published.order(created_at: :desc).page(params[:page]).per(8)

  end

  def show
    @diary_user = @diary.end_user
    @recent_weight = Weight.where(end_user_id: @diary_user.id).order(record_day: :asc).last
    @diary_comment = DiaryComment.new
    @diary_comment.end_user_id = current_end_user.id
    @diary_comments = @diary.diary_comments

  end

  def personal_index
    @diary_user = EndUser.find(params[:id])
    if @diary_user == current_end_user
      @diaries = Diary.where(end_user_id: @diary_user.id).order(created_at: :desc).page(params[:page]).per(8)
    else
      @diaries = Diary.published.where(end_user_id: @diary_user.id).order(created_at: :desc).page(params[:page]).per(8)
    end

  end

  def create
    @diary = Diary.new(diary_params)
    @diary.end_user_id = current_end_user.id
    if @diary.save
      redirect_to diaries_path, notice: "日記を投稿しました！"
    else
      @diaries = Diary.published.order(created_at: :desc).page(params[:page]).per(8)
      render :index, alert: "投稿できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
    end
  end

  def edit
  end

  def update
    if @diary.update(diary_params)
      flash[:notice] = "日記を更新しました。"
      redirect_to diary_path(@diary)
    else
      flash[:alret] = "更新に失敗しました。"
      render :edit
    end
  end

  def destroy
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
    params.require(:diary).permit(:title, :body, :is_published_flag)
  end

  def set_post
    @diary = Diary.find(params[:id])
  end

end
