class RegistrationsController < Devise::RegistrationsController
  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :structure, :fonction, :avatar, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :structure, :fonction, :avatar, :password_confirmation, :current_password) }
  end
end
