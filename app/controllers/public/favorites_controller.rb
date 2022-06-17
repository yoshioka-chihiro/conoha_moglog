class Public::FavoritesController < ApplicationController

  def create
    @diary_favorite = Favorite.new(end_user_id: current_end_user.id, diary_id: params[:diary_id])
    @diary_favorite.save
    @diary = Diary.find(params[:diary_id])
    render 'index'
  end

  def destroy
    @diary_favorite = Favorite.find_by(end_user_id: current_end_user.id, diary_id: params[:diary_id])
    @diary_favorite.destroy
    @diary = Diary.find(params[:diary_id])
    render 'index'
  end
end
