class Public::SearchesController < ApplicationController
  before_action :authenticate_end_user!

  def search
    # タグ検索の場合（＃が先頭についている）
    if (params[:search]).start_with?("#")
      if (params[:search]) != '#'
      # 検索ワードの先頭から「＃」を削除
        search_tag = (params[:search]).delete_prefix("#")
      # タグ名で一致するものを配列で取得し最新のものを変数にタグで挿入
      # タグ名は完全一致でのみの検索・同じ名前は存在しないため
        tag = Tag.where(tag_name: search_tag).order(created_at: :asc).last
      # タグが存在するかどうかの判断
        return if !tag 
      # タグ名に紐づく日記を取得
        search_diaries = tag.diaries.order(created_at: :desc)
      else
      # 「＃」のみの時は全ての日記を返す
        search_diaries = Diary.all.order(created_at: :desc)
      end
      @diaries = Kaminari.paginate_array(search_diaries).page(params[:page]).per(10)
    else
      # キーワード検索の場合（＃が先頭についていない）
      @diaries = Diary.looks(params[:search]).page(params[:page]).per(8)
    end

  end
end