class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user! # para autenticar - quitar luego el comment
  before_action :configure_permitted_parameters, if: :devise_controller?



  def after_sign_in_path_for(_resource)
    dashboard_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username])

    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username])
  end
end
