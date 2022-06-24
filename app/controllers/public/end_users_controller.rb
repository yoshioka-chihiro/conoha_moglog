class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!

  def index
    @end_users = EndUser.all
    @q = EndUser.ransack(params[:q])
  end

  def show
    @end_user = EndUser.find(params[:id])
    @recent_weight = Weight.where(end_user_id: @end_user.id).order(record_day: :asc).last
  end

  def search
    # :qはransackのデフォルトキーなので変更しない
    @q = EndUser.ransack(params[:q])
    # (distinct: true)によりresultの重複をなくしてくれている
    @results = @q.result(distinct: true).order(id: :asc).page(params[:page]).per(8)
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      flash[:notice] = "編集に成功しました。"
      redirect_to end_user_path(@end_user)
    else
      flash[:alret] = "編集に失敗しました。"
      render :edit
    end
  end

  def quit
  end

  def withdraw
    #現在ログインしているユーザーを@end_userに格納
    @end_user = EndUser.find(current_end_user.id)
     if @end_user.update(is_deleted: true)
       flash[:notice] = " 退会しました"
      #sessionIDのresetを行う
      reset_session
      redirect_to root_path
     else
      flash[:notice] = " 退会に失敗しました"
      render :show
     end
  end

  def favorites
    @end_user = EndUser.find(params[:end_user_id])
    favorites= Favorite.where(end_user_id: @end_user.id).pluck(:diary_id)
    @favorite_diaries = Diary.find(favorites)
  end




private

  def end_user_params
    params.require(:end_user)
    .permit(:email, :name, :nickname, :gender, :start_weight, :objective_weight, :age, :height, :profile_image, :active_level)
  end

end
