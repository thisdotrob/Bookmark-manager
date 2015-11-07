require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,         Serial
  property :username,   String, required: true, message: 'Username is empty.'
  property :email,      String, required: true, format: :email_address,
                            messages: {
                              presence: 'Email is empty.',
                              format: 'Incorrect email format.'
                            }
  property :password,   BCryptHash

  attr_accessor :password_confirmation

  validates_confirmation_of :password, message: 'Passwords do not match.'

end
