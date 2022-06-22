# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :end_user_state, only: [:create]
  
  def new_guest
    user = EndUser.guest
    sign_in user   # ユーザーをログインさせる
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインしました"
    end_user_path(@end_user)
  end


  def after_sign_out_path_for(resource)
    flash[:notice] = " ログアウトしました"
    root_path
  end


  # 退会しているかを判断するメソッド
  def end_user_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @end_user = EndUser.find_by(email: params[:end_user][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    ## もし@customerがある（!true=false）なら下の処理へ、ない（!false=true）ならreturnして
    return if !@end_user
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致（true）　かつ　is_withdrawalが（false）
      if @end_user.valid_password?(params[:end_user][:password]) && !(@end_user.is_deleted?)
        ## 【処理内容3】（!false=true）だった場合、退会していないのでcreateを実行
        ## 何も書かなくていい
      else
        ## !true（false）だった場合、退会しているのでサインアップ画面に遷移する
        flash[:notice] = "退会済みです。新規会員登録を行なってください"
        redirect_to new_end_user_registration_path
      end
  end



  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
