class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_uid
    if cookies.signed[:user_id] && (u = User.find(cookies.signed[:user_id]))
      session[:user_id] ||= u.id
    end
    session[:user_id]
  end
end
