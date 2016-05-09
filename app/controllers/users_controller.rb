class UsersController < ApplicationController
  def index
    admin_only
    @users = User.all
  end

  def show
  end

  def edit
    admin_only
    @user = User.find(params[:id])
  end

  def update
    admin_only
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "Successfully Updated #{@user.email}."
    redirect_to admin_users_path(current_user)
  end

  def user_params
    params.require(:user).permit(:admin)
  end
end
