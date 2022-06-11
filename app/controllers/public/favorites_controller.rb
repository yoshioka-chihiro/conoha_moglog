class Public::FavoritesController < ApplicationController

  def create
    @diary_favorite = Favorite.new(end_user_id: current_end_user.id, diary_id: params[:diary_id])
    @diary_favorite.save
    redirect_to diary_path(params[:diary_id])
  end

  def destroy
    @diary_favorite = Favorite.find_by(end_user_id: current_end_user.id, diary_id: params[:diary_id])
    @diary_favorite.destroy
    redirect_to diary_path(params[:diary_id])


  end
end
