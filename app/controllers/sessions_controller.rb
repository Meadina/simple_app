# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: params[:session][:name])
    if user&.authenticate(params[:session][:password])
      user.last_sign_in = Time.now
      log_in user
      redirect_to root_url
    else
      flash.now[:danger] = 'Неверный логин/пароль!'
      render 'new'
    end
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
