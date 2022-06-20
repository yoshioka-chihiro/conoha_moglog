class Public::ConditionsController < ApplicationController
  def index
    @condition = Condition.new
    # ログイン中のユーザーのデータを取得
    @condition_all = Condition.all
    @conditions = Condition.where(end_user_id: current_end_user.id).order(created_at: :desc)
    # 最新のConditionデータを１件取得
    @lastest_condition = Condition.where(end_user_id: current_end_user.id).order(created_at: :asc).last
    # 現在の時間
    now = Time.now
    # 24時間前
    one_day_ago = now - 1.day
    # 48日前
    two_days_ago = now - 2.day
    # 今から24〜48時間の間に記録された食事を取得
    @search_meals = Meal.where(record_time: one_day_ago..two_days_ago).order(record_time: :desc)
  end

  def show
    @condition = Condition.find(params[:id])
    # 体調が記録された時間の24時間前
    one_day_ago =  @condition.created_at - 1.day
    # 体調が記録された時間の48時間前
    two_days_ago =  @condition.created_at - 2.day
    # 体調が記録された時間から24〜48時間の間に記録された食事を取得
    @search_meals = Meal.where(record_time: one_day_ago..two_days_ago)
  end

  def create
    @condition = Condition.new(condition_params)
    @condition.end_user_id = current_end_user.id
    if @condition.save
      redirect_to conditions_path, notice: "体調を登録しました！"
    else
      @conditions = Condition.all
      render :index, alert: "登録できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
    end
  end

  def edit
    @condition = Condition.find(params[:id])
  end

  def update
    @condition = Condition.find(params[:id])
    if @condition.update(condition_params)
      @conditions = Condition.all
      flash[:notice] = "更新しました。"
      redirect_to conditions_path
    else
      flash[:alret] = "更新に失敗しました。"
      render :edit
    end
  end


  def destroy
    @condition = Condition.find(params[:id])
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


end
