class User < ActiveRecord::Base
	validates :full_name, :presence => true, :length => { :minimum => 3 }
	has_secure_password #this is a method inside gem bcrypt that allows user to encrypt the password given, and able to authenticate it automatically.
	validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}	

end
