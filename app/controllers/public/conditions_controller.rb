class Public::ConditionsController < ApplicationController
  before_action :authenticate_end_user!
  before_action :correct_end_user, only: [:show, :edit, :update, :destroy]


  def index
    @condition = Condition.new
    # ログイン中のユーザーのデータを取得
    @conditions = Condition.where(end_user_id: current_end_user.id).order(created_at: :desc)
    # 最新のConditionデータを１件取得
    @lastest_condition = Condition.where(end_user_id: current_end_user.id).order(created_at: :asc).last
    # 現在の時間
    now = Time.now
    # 24時間前
    one_day_ago = now - 1.day
    # 48日前
    two_days_ago = now - 2.day
    # ログイン中のユーザーのデータを取得
    @user_meals = Meal.where(end_user_id: current_end_user.id)
    # 今から24〜48時間の間に記録された食事を取得
    @search_meals = @user_meals.where(record_time: two_days_ago..one_day_ago).order(record_time: :desc)
  end

  def show
    # 体調が記録された時間の24時間前
    one_day_ago =  @condition.start_time - 1.day
    # 体調が記録された時間の48時間前
    two_days_ago =  @condition.start_time - 2.day
    # ログイン中のユーザーのデータを取得
    @user_meals = Meal.where(end_user_id: current_end_user.id)
    # 体調が記録された時間から24〜48時間の間に記録された食事を取得
    @search_meals = @user_meals.where(record_time: two_days_ago..one_day_ago)
  end

  def create
    @condition = Condition.new(condition_params)
    @condition.end_user_id = current_end_user.id
    if @condition.save
      redirect_to condition_path(@condition), notice: "体調を登録しました！"
    else
      @conditions = Condition.all
      render :index, alert: "登録できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
    end
  end

  def edit
  end

  def update
    if @condition.update(condition_params)
      @conditions = Condition.all
      flash[:notice] = "更新しました。"
      redirect_to condition_path(@condition)
    else
      flash[:alret] = "更新に失敗しました。"
      render :edit
    end
  end


  def destroy
    if @condition.destroy
      flash[:notice] = "体調を削除しました"
      @conditions = Condition.all
      redirect_to conditions_path
    else
      render :index
    end
  end

  private

  def condition_params
    params.require(:condition).permit(:movement, :feel, :start_time)
  end

  def correct_end_user
    @condition = Condition.find(params[:id])
    @end_user = @condition.end_user
    # ログイン中のユーザーではないまたは退会済みユーザーの場合はアクセスできない
    redirect_to(root_path) unless @end_user == current_end_user || (current_end_user.is_deleted == true)
  end


end
