class Public::DiariesController < ApplicationController
  before_action :authenticate_end_user!
  before_action :set_diary, only: [:show, :edit, :update, :destroy]


  def index
    @diary = Diary.new
    if params[:tag_id].present?
      # paramsで:tag_idを受け取った場合
      # （クリックしたときにパラメータでtag_idを受け取ったときに発動する。タグで絞込む機能）
      @tag = Tag.find(params[:tag_id])
      diaries = @tag.diaries.order(created_at: :desc)
    else
      # 普通にページを表示させた場合
       diaries = Diary.published.order(created_at: :desc).page(params[:page]).per(8)
    end
    # 表示用
    @diaries = Kaminari.paginate_array(diaries).page(params[:page]).per(8)
    # タグ投稿数が多い順に２０個表示
    @tag_lists = Tag.find(TagDiary.group(:tag_id).order('count(tag_id) desc').limit(20).pluck(:tag_id))
  end


  def show
    @diary_user = @diary.end_user
    # 日記ユーザーの最新の体重を取得（昇順の最後）
    @recent_weight = Weight.where(end_user_id: @diary_user.id).order(record_day: :asc).last
    # コメント投稿用
    @diary_comment = DiaryComment.new
    @diary_comment.end_user_id = current_end_user.id
    @diary_comments = @diary.diary_comments
  end

  def personal_index
    # プロフィールからのリンクのため
    @diary_user = EndUser.find(params[:id])
    # ログイン中のユーザーのページのみ非公開／公開切り替えボタンを表示
    if @diary_user == current_end_user
      # Aまたは未選択の場合は公開・Bは非公開
      if params[:option] == "A" || params[:option] == nil
      # 公開日記
       @diaries = Diary.published.where(end_user_id: @diary_user.id).order(created_at: :desc).page(params[:page]).per(8)
      elsif params[:option] == "B"
      # 非公開日記
       @diaries = Diary.unpublished.where(end_user_id: @diary_user.id).order(created_at: :desc).page(params[:page]).per(8)
      end
    else
      # 他ユーザーは公開日記のみ閲覧できる
      @diaries = Diary.published.where(end_user_id: @diary_user.id).order(created_at: :desc).page(params[:page]).per(8)
    end
  end


  def create
    @diary = Diary.new(diary_params)
    # 入力されたタグ名を取得し、半角スペースで区切って配列で取得
    tag_list = params[:diary][:tag_name].split(nil)
    @diary.end_user_id = current_end_user.id
    if @diary.save
      # タグ保存用メソッドでタグを保存（diary.rbで定義）
      @diary.save_tags(tag_list)
      redirect_to diary_path(@diary), notice: "日記を投稿しました！"
    else
      @diaries = Diary.published.order(created_at: :desc).page(params[:page]).per(8)
      @tag_lists = Tag.find(TagDiary.group(:tag_id).order('count(tag_id) desc').limit(20).pluck(:tag_id))
      render :index, alert: "投稿できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
    end
  end

  def edit
    @tag_list = @diary.tags.pluck(:tag_name).split(nil)
  end

  def update
    @tag_list = @diary.tags.pluck(:tag_name).split(nil)
    tag_list = params[:diary][:tag_name].split(nil)
    if @diary.update(diary_params)
      @diary.save_diaries(tag_list)
      flash[:notice] = "日記を更新しました。"
      redirect_to diary_path(@diary)
    else
      flash[:alret] = "更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    if @diary.destroy
      flash[:notice] = "日記を削除しました"
      @diaries = Diary.published.order(created_at: :desc).page(params[:page]).per(8)
      redirect_to diaries_path
    else
      render :index
    end
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :body, :is_published_flag)
  end

  def set_diary
    @diary = Diary.find(params[:id])
  end

end
