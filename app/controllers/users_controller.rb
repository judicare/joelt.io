class UsersController < ApplicationController
  def login
    if session[:user_id]
      flash[:error] = "You are already logged in as #{User.find(session[:user_id]).username}."
      redirect_to :root
    end
  end
  
  def try_login
    uname, pw = params[:username], params[:password]
    case (u = User.authenticate(uname, pw))
    when nil
      flash[:error] = "Invalid username or password."
      redirect_to :back
    else
      session[:user_id] = u.id
      flash[:notice] = "Logged in successfully."
      redirect_to :root
    end
  end
end
