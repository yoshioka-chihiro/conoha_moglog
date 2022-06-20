class Public::SearchesController < ApplicationController
  before_action :authenticate_end_user!

  def search

    if params[:search] == nil || ''
      @diaries = Diary.all.page(params[:page]).per(8)
    elsif params[:search] == ''
      @diaries = Diary.all.page(params[:page]).per(8)
    else
      @diaries = Diary.where("title LIKE ? ",'%' + params[:search] + '%').page(params[:page]).per(8)
    end

  end

end