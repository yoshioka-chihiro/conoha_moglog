class Public::SearchesController < ApplicationController
  before_action :authenticate_end_user!

  def search
    
    if params[:search] == nil || ''
      @diaries = Diary.all
    elsif params[:search] == ''
      @diaries = Diary.all
    else
      @diaries = Diary.where("title LIKE ? ",'%' + params[:search] + '%')
    end
    
  end
  
end