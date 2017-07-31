class ApplicationController < ActionController::Base
  layout :layout_by_resource

  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def index
    redirect_to users_path
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:name, :description, :avatar, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

end
