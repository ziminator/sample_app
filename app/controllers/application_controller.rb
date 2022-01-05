class ApplicationController < ActionController::Base
  #include SessionsHelper

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  #private

  # Confirms a logged-in user.
  #def logged_in_user
  #  unless logged_in?
  #    store_location
  #    flash[:danger] = "Please log in."
  #    redirect_to login_url
  #  end
  #end
end
