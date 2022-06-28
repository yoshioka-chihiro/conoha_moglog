class Admin::EndUsersController < ApplicationController
  before_action :set_end_user, only: [:show, :edit, :update]

  def show
  end


  def edit
  end

  def update
    if @end_user.update(end_user_params)
      flash[:notice] = "編集に成功しました。"
      redirect_to admin_end_user_path(@end_user)
    else
      flash[:alret] = "編集に失敗しました。"
      render :edit
    end
  end
  
  def search
    # :qはransackのデフォルトキーなので変更しない
    @q = EndUser.ransack(params[:q])
    # (distinct: true)によりresultの重複をなくしてくれている
    @results = @q.result(distinct: true).order(id: :asc).page(params[:page]).per(8)
  end


  private

  def end_user_params
    params.require(:end_user).permit(:email, :name, :nickname, :gender, :start_weight, :objective_weight, :age, :height, :is_deleted)
  end
  
  def set_end_user
    @end_user = EndUser.find(params[:id])
  end

end
