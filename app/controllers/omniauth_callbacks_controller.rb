class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.valid?
      sign_in_and_redirect @user
    else
      flash[:notice] = "User email has already been taken. Please choose a unique email or sign in."
      redirect_to root_path
    end
  end
end
