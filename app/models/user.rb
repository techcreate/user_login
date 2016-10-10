class User < ActiveRecord::Base
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, presence: true, length: { minimum: 2 }
	validates :email_address, presence: true, uniqueness: { case_sensitive: false }, format: {with: EMAIL_REGEX }
	validates :age, presence: true, numericality: true  
	before_save do 
		self.email.downcase!
	end
end
