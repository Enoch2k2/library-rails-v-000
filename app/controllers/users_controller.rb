class UsersController < ApplicationController
  def index
    if current_user.admin?
      @users = User.all
      respond_to do |format|
        format.html { render :index }
        format.json {render json: @users, adapter: :json }
      end
    else
      flash[:alert] = "Access Denied."
      redirect_to root_path
    end
    admin_only
    @users = User.all
  end

  def show
    @user = current_user if user_signed_in?
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @user, adapter: :json }
    end
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
