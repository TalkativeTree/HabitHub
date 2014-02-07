class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  around_filter :user_time_zone, if: :current_user

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  protected

  def user_time_zone
    Time.use_zone(current_user.time_zone) { yield }
  end

  def configure_devise_permitted_parameters
    registration_params = [:email, :cellphone_number, :password, :password_confirmation, :time_zone]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) {
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) {
        |u| u.permit(registration_params)
      }
    end
  end
end
