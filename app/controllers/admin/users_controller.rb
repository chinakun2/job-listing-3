class Admin::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin
  layout 'admin'

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.is_admin
      flash[:warning] = "管理员用户不可删除，请取消权限"
    else
      @user.destroy
    end
    redirect_to admin_users_path
  end

  protected

  def user_params
    params.require(:user).permit(:email, :is_admin)
  end
end
