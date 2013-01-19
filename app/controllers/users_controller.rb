class UsersController < ApplicationController
  before_filter :require_auth, except: [:login, :try_login]
  
  def login
    redirect_to :root if session[:user_id]
  end
  
  def try_login
    uname, pw = params[:username], params[:password]
    case (u = User.authenticate(uname, pw))
    when nil
      flash[:error] = "wrong."
      redirect_to :back
    else
      cookies.permanent.signed[:user_id] = u.id
      session[:user_id] = u.id
      redirect_to :root
    end
  end
  
  def new_pass
    @user = User.find session[:user_id]
  end
  
  def change_pass
    @user = User.find(session[:user_id])
    @user.new_password = params[:new_password]
    @user.new_password_confirmation = params[:new_password_confirmation]
    if @user.save
      redirect_to :root
    else
      render action: :new_pass
    end
  end
  
  def logout
    session.delete :user_id
    cookies.delete :user_id
    redirect_to :root
  end
  
  private
  def require_auth
    redirect_to :root unless session[:user_id]
  end
end
