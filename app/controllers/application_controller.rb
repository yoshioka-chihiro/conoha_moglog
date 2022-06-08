class ApplicationController < ActionController::Base
  # サインイン・ログインに必要なパラメーター
   before_action :configure_permitted_parameters, if: :devise_controller?
   # URLにadminが含まれるページはadminにログイン後のみ閲覧可
   before_action :authenticate_admin!, if: :admin_url
   
   def admin_url
    request.fullpath.include?("/admin")
   end

   protected


  def configure_permitted_parameters
    if resource_class == EndUser
      devise_parameter_sanitizer.permit(:sign_up, keys: [ :email, :password, :password_confirmation, :name, :nickname, :gender, :start_weight, :objective_weight, :age, :height ])
      devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
      devise_parameter_sanitizer.permit(:account_update,keys:[ :email, :password, :password_confirmation, :name, :nickname, :gender, :start_weight, :objective_weight, :age, :height ])
    else
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
      devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
      devise_parameter_sanitizer.permit(:account_update,keys:[:email])
    end
  end

end
