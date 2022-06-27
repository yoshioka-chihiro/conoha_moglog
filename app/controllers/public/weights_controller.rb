class Public::WeightsController < ApplicationController
  before_action :authenticate_end_user!
  before_action :correct_end_user, only: [:edit, :update, :destroy]


  def index
    @weights = Weight.where(end_user_id: current_end_user.id).order(record_day: :desc).page(params[:page]).per(8)
    @weight = Weight.new
    @graph = Weight.where(end_user_id: current_end_user.id).pluck(:record_day, :value)
    @objective_weight = current_end_user.objective_weight
  end

  def create
    @weight = Weight.new(weight_params)
    if @weight.save
      flash[:notice] = "体重を登録しました！"
      redirect_to action: 'index'
    else
      flash[:notice] = "登録できませんでした"
      @weights = Weight.where(end_user_id: current_end_user.id).order(record_day: :desc).page(params[:page]).per(8)
      @graph = Weight.where(end_user_id: current_end_user.id).pluck(:record_day, :value)
      render :index
    end
  end

  def edit
  end

  def update
    if @weight.update(weight_params)
      flash[:notice] = "体重を更新しました。"
      @weights = Weight.where(end_user_id: current_end_user.id)
      redirect_to weights_path
    else
      flash[:alret] = "更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    if @weight.destroy
      flash[:notice] = "体重を削除しました"
      @weights = Weight.where(end_user_id: current_end_user.id)
      redirect_to weights_path
    else
      render :index
    end
  end


  private

  def weight_params
    params.require(:weight)
    .permit(:value, :record_day)
    .merge(end_user_id: current_end_user.id)
  end

  def correct_end_user
    @weight = Weight.find(params[:id])
    @end_user = @weight.end_user
    # ログイン中のユーザーではないまたは退会済みユーザーの場合はアクセスできない
    redirect_to(root_path) unless @end_user == current_end_user || (current_end_user.is_deleted == true)
  end

  def set_weight
    @weight = Weight.find(params[:id])
  end


end
