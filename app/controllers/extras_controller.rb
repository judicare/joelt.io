class ExtrasController < ApplicationController
  def hire
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def email
    if params[:email] =~ /^[^@]+@[^@]+$/
      HireMailer.hire(params).deliver
      flash[:notice] = "Done."
    else
      flash[:error] = "Enter a valid email."
    end
    respond_to do |format|
      format.html { redirect_to :root }
      format.js
    end
  end
end
