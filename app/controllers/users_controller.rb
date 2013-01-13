class UsersController < ApplicationController
  def login
    redirect_to :root if session[:user_id]
  end
  
  def try_login
    uname, pw = params[:username], params[:password]
    case (u = User.authenticate(uname, pw))
    when nil
      flash[:error] = "Invalid username or password."
      redirect_to :back
    else
      cookies.permanent.signed[:user_id] = u.id
      session[:user_id] = u.id
      redirect_to :root
    end
  end
  
  def logout
    session.delete :user_id
    cookies.delete :user_id
    redirect_to :root
  end
end
