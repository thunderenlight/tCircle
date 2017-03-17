class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :setup_devise_params, if: :devise_controller?


  protected

   def setup_devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :bio, :username])
  end

end
