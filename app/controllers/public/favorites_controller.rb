class Public::FavoritesController < ApplicationController

  def create
    @diary_favorite = Favorite.new(end_user_id: current_end_user.id, diary_id: params[:diary_id])
    @diary_favorite.save
    redirect_to diary_path(params[:diary_id])

    # @diary = Diary.find(params[:diary_id])
    # favorite = current_end_user.favorites.new(diary_id: @diary.id)
    # favorite.save
  end

  def destroy
    # @diary = Diary.find(params[:diary_id])
    # favorite = current_end_user.favorites.find_by(diary_id: @diary.id)
    # favorite.destroy

    @diary_favorite = Favorite.find_by(end_user_id: current_end_user.id, diary_id: params[:diary_id])
    @diary_favorite.destroy
    redirect_to diary_path(params[:diary_id])


  end
end
