class Public::MealsController < ApplicationController
  def index
    @meal = Meal.new
    # mealに紐付くmeal_detailsをbuildしておく
    @meal_detail = @meal.meal_details.build
    @meals = Meal.all
  end

  def create
    # @meal = current_end_user.meals.build(meal_params)
    @meal = Meal.new(meal_params)
    if @meal.save
      redirect_to meals_path, notice: "食事を投稿しました！"
    else
      @meal = Meal.new
      @mealdetail = MealDetail.new
      @meals = Meal.all
      render :index, alert: "登録できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
    end
  end

  def show
  end

  def destroy
    @meal = Meal.find(params[:id])
    if @meal.destroy
      flash[:notice] = "食事を削除しました"
      @meals = Meal.all
      redirect_to meals_path
    else
      render :index
    end
  end

  private

  def meal_params
    params.require(:meal).permit(
      :meal_type,:recorded_at,
      meal_details_attributes:[:id, :meal_id, :food_id, :quantity, :_destroy])
      .merge(end_user_id: current_end_user.id)
  end


end
