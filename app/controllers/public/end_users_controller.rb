class Public::EndUsersController < ApplicationController

  def index
    @end_users = EndUser.all
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      flash[:notice] = "編集に成功しました。"
      redirect_to end_user_path(@end_user)
    else
      flash[:alret] = "編集に失敗しました。"
      render :edit
    end
  end

  def image_destroy
    @image = current_end_user.image
    if @image.destroy
      flash[:alret] = "プロフィール写真を削除しました。"
      redirect_to edit_end_user_path(current_end_user.id)
    end
  end



private

  def end_user_params
    params.require(:end_user)
    .permit(:email, :name, :nickname, :gender, :start_weight, :objective_weight, :age, :height, :image, :active_level)
  end

end
