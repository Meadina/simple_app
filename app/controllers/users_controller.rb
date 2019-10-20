# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: %i[show]
  before_action :admin_user,  only: %i[create update edit index destroy]

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'Пользователь удален'
    redirect_to users_url
  end

  def show
    @user = User.find(params[:id])
    if correct_user
      redirect_to(current_user)
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Пользователь успешно добавлен'
      render 'edit'
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Профиль обновлен'
      redirect_to users_url
    else
      render 'edit'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :password,
                                 :password_confirmation, :comment, :last_sign_in)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = 'Пожалуйста, войдите'
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user) || current_user.admin?
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
