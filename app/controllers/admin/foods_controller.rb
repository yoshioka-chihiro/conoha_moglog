class Admin::FoodsController < ApplicationController
   before_action :set_food, only: [:show, :edit, :update, :destroy]

  def index
    @foods = Food.all.order(created_at: :desc).page(params[:page]).per(8)
    @q = Food.ransack(params[:q])
  end

  def show
  end

  def search
    # :qはransackのデフォルトキーなので変更しない
    @q = Food.ransack(params[:q])
    # (distinct: true)によりresultの重複をなくしてくれている
    @results = @q.result(distinct: true).order(id: :asc).page(params[:page]).per(8)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      flash[:notice] = "食品を登録しました。"
      redirect_to admin_food_path(@food)
    else
      flash[:alert] = "食品を登録できませんでした。"
      render :new
    end
  end

  def edit
  end

  def update
    if @food.update(food_params)
      flash[:notice] = "編集に成功しました。"
      redirect_to admin_food_path(@food)
    else
      flash[:alret] = "編集に失敗しました。"
      render :edit
    end
  end

  def destroy
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

  def set_food
    @food = Food.find(params[:id])
  end
end
