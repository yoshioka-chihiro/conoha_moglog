class Public::WeightsController < ApplicationController

  def index
    @weights = Weight.all
    @weight = Weight.new
  end

  def edit
  end

  def create
    @weight = Weight.new(weight_params)
    if @weight.save
      flash[:notice] = "体重を登録しました！"
      redirect_to action: 'index'
    else
      render :new
    end
  end


  private

  def weight_params
    params.require(:weight).permit(:value, :recorded_at).merge(end_user_id: current_end_user.id)
  end


end
