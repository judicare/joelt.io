task :update_token do
  open(File.join(Rails.root, "config/initializers/secret_token.rb"), "w") do |f|
    f.write "Otters::Application.config.secret_token = '#{SecureRandom.urlsafe_base64 128}'"
  end
end