class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  def admin_only
    if user_signed_in?
      if !current_user.admin?
        flash[:alert] = "Access Denied."
        redirect_to root_path
      end
    else
      flash[:alert] = "You must sign in to access this page."
      redirect_to root_path
    end
  end
end
