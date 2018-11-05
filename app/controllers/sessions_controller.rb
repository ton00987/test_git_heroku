class SessionsController < ApplicationController
  # user shouldn't have to be logged in before logging in!

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