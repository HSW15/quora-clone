class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_secure_password #this is a method inside gem bcrypt that allows user to encrypt the password given, and able to authenticate it automatically.
end
