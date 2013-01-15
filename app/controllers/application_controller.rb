class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :old_login
  
  def old_login
    session[:user_id] ||= User.find(cookies.signed[:user_id]) if cookies.signed[:user_id]
  end
end
