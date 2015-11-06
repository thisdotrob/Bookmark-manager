require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,         Serial
  property :username,   String
  property :email,      String
  property :password,   BCryptHash
  
end
