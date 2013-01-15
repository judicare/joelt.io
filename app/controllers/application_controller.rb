class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :old_login
  
  def old_login
    if !session[:user_id] && cookies.signed[:user_id] && (u = User.find(cookies.signed[:user_id]))
      session[:user_id] = u.id
    end
  end
end
