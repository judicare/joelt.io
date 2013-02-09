class ExtrasController < ApplicationController
  def hire
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def email
    @msg = Message.new *params.values_at(:email, :name, :project)
    HireMailer.hire(params).deliver! if @msg.valid?

    respond_to do |format|
      format.html { redirect_to hire_me_path }
      format.js
    end
  end
  
  def signature
    img = Magick::Image.new(420, 50) {
        self.background_color = 'transparent'
        self.format = 'png'
    }

    d = Magick::Draw.new
    
    5.times do |i|
      d.fill random_hex
      d.path "M0,0 h#{400 - (80 * i) - (rand(39) + 1)} l10,50 H#{i == 4 ? 10 : 12} z"
    end

    d.draw img
    
    respond_to do |format|
      format.png {
        send_data img.to_blob, :stream => false, :filename => 'signature.png', :type => 'image/png', :disposition => 'inline'
      }
    end
  end
  
  private
  def random_hex
    "#" + Array.new(3) { rand(205).to_s(16).rjust(2, "0") }.join("")
  end
end
