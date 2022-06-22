class Admin::EndUsersController < ApplicationController

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
      redirect_to admin_end_user_path(@end_user)
    else
      flash[:alret] = "編集に失敗しました。"
      render :edit
    end
  end

  private

  def end_user_params
    params.require(:end_user).permit(:email, :name, :nickname, :gender, :start_weight, :objective_weight, :age, :height, :is_deleted)
  end

end
