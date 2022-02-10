class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user! # para autenticar - quitar luego el comment
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit
  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end
  private

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  protected

  def after_sign_in_path_for(_resource)
    dashboard_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username])

    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username])
  end
end
