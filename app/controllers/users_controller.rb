class UsersController < ApplicationController
  def index
    if current_user.admin?
      @users = User.all
    else
      flash[:alert] = "Access Denied."
      redirect_to root_path
    end
  end

  def show
  end

  def edit
    if current_user.admin?
      @user = User.find(params[:id])
    else
      flash[:alert] = "Access Denied."
      redirect_to root_path
    end
  end

  def update
    if current_user.admin?
      @user = User.find(params[:id])
      @user.update(user_params)
      flash[:notice] = "Successfully Updated #{@user.email}."
      redirect_to admin_users_path(current_user)
    else
      flash[:alert] = "Access Denied."
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:admin)
  end
end
