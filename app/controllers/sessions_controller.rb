# frozen_string_literal: true

class SessionsController < ApplicationController

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

end
