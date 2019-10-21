# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :logged_in_user, only: :create
  def new; end

  def create
    user = User.find_by(name: params[:session][:name])
    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to root_url
    else
      flash.now[:danger] = 'Неверный логин/пароль!'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private
  def logged_in_user
    if logged_in?
      flash[:danger] = 'Вы уже вошли в систему'
      redirect_to root_path
    end
  end
end
