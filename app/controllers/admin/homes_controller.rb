class Admin::HomesController < ApplicationController

  def top
    @end_users = EndUser.all.order(created_at: :desc).page(params[:page]).per(8)
    @q = EndUser.ransack(params[:q])
  end

  def search
    # :qはransackのデフォルトキーなので変更しない
    @q = EndUser.ransack(params[:q])
    # (distinct: true)によりresultの重複をなくしてくれている
    @results = @q.result(distinct: true).order(id: :asc).page(params[:page]).per(8)
  end

end
