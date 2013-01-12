require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessor :new_password, :new_password_confirmation
  
  validates_confirmation_of :new_password, :if => :password_changed?
  
  before_save :hash_new_password, :if => :password_changed?
  
  def password_changed?
    !@new_password.blank?
  end
  
  def self.authenticate(username, pw)
    if user = find_by_username(username)
      if BCrypt::Password.new(user.hashed_password).is_password? pw
        return user
      end
    end
  end
  
  private
  def hash_new_password
    self.hashed_password = BCrypt::Password.create(@new_password)
  end
end
