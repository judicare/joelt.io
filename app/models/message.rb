class Message < Struct.new(:email, :name, :project)
  include ActiveModel::Validations
  
  validates_presence_of :email, :name, :project
  validates_format_of :email, with: /[^@]+@[^@]+/, message: "must be valid"
end