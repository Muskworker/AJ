# Controller for sessions
class SessionsController < ApplicationController
  def create
    if auth
      session[:user_email] = auth[:info][:email]
      user = User.find_or_create_by(email: session[:user_email])

      session[:logged_in] = user.id
    end

    redirect_to controller: :pages, action: :home
  end

  def delete
    session[:logged_in] = nil
    redirect_to controller: :pages, action: :home
  end

  protected

  def auth
    request.env['omniauth.auth']
  end
end
