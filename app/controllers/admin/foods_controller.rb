class Admin::FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      flash[:notice] = "食品を登録しました。"
      redirect_to admin_foods_path
    else
      flash[:alert] = "食品を登録できませんでした。"
      render :new
    end
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])
    if @food.update(food_params)
      flash[:notice] = "編集に成功しました。"
      redirect_to admin_food_path(@food)
    else
      flash[:alret] = "編集に失敗しました。"
      render :edit
    end
  end

  def destroy
    @food = Food.find(params[:id])
    if @food.destroy
     flash[:notice] = "削除しました。"
     @foods = Food.all
     redirect_to admin_foods_path
    else
     flash[:alret] = "削除に失敗しました。"
     render :show
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :introduction, :calorie, :protein, :carbohydrate, :fat, :fiber)
  end
end
