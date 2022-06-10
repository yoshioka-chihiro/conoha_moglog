class Public::ConditionsController < ApplicationController
  def index
    @condition = Condition.new
    @conditions = Condition.all
  end
  
  def show
    @condition = Condition.find(params[:id])
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
    params.require(:condition).permit(:movement, :feel)
  end


end
