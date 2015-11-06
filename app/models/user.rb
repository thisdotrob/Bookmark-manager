require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,         Serial
  property :username,   String
  property :email,      String
  property :password,   BCryptHash

  attr_accessor :password_confirmation

  validates_confirmation_of :password, #confirm: :password_confirmation

end
