class User < ActiveRecord::Base

	has_many :questions, dependent: :destroy
	has_many :answers, dependent: :destroy
	has_many :answers_votes, dependent: :destroy
	has_many :question_votes, dependent: :destroy
	validates :full_name, :presence => true, :length => { :minimum => 3 }

	has_secure_password #this is a method inside gem bcrypt that allows user to encrypt the password given, and able to authenticate it automatically.

	validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}	

end
