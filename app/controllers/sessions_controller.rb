class SessionsController < ApplicationController

  def index
    # render 'index'
  end
  def create
    user = Moviegoer.from_omniauth(request.env["omniauth.auth"])

    if user.valid?
      session[:user_id] = user.id
      redirect_to movies_path
    end
  end
  
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'Logged out successfully.'
    redirect_to movies_path
  end
end