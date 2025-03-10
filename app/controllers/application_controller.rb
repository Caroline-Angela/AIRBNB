class ApplicationController < ActionController::Base
<<<<<<< HEAD
  before_action :authenticate_user!
=======
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
>>>>>>> 233f336fb73563a5f5e8c8a037a0ef3d9e7a0834
end
