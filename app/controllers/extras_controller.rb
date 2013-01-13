class ExtrasController < ApplicationController
  def hire
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def email
    @msg = Message.new *params.values_at(:email, :name, :project)
    HireMailer.hire(params).deliver if @msg.valid?

    respond_to do |format|
      format.html { redirect_to hire_me_path }
      format.js
    end
  end
end
