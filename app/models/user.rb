require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,       Serial
  property :email,    String, required: true,
                              unique:   true,
                              format:   :email_address,
                              messages: { presence:  'Email is empty.',
                                          is_unique: 'User already exists.',
                                          format:    'Incorrect email format.' }
  property :password, BCryptHash

  attr_accessor :password_confirmation
  validates_confirmation_of :password, message: 'Passwords do not match.'

end
