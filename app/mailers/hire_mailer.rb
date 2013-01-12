class HireMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def hire e
    @params = e
    mail(:to => "joel@otte.rs", :subject => "Someone named #{e[:name]} wants to hire you", :from => e[:email])
  end
end
