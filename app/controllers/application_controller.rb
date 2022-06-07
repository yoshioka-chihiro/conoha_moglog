class ApplicationController < ActionController::Base

   protected


  def configure_permitted_parameters
    if resource_class == End_user
      devise_parameter_sanitizer.permit(:sign_up, keys: [ :email, :password, :password_confirmation, :name, :nickname, :gender, :start_weight, :objective_weight, :age, :height ])
      devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
      devise_parameter_sanitizer.permit(:account_update,keys:[ :email, :password, :password_confirmation, :name, :nickname, :gender, :start_weight, :objective_weight, :age, :height ])
    else
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
      devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
      devise_parameter_sanitizer.permit(:account_update,keys:[:name,:email])
    end
  end

end
