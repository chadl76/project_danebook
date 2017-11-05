class User < ApplicationRecord
	has_secure_password
	before_create :generate_token
	validates :first_name, :last_name, :email, :password_confirmation, presence: true
	validates :password, length: {maximum: 64}, :allow_nil => nil
	validates :email, length: {maximum: 64}, format: { with: /@/}
	


	def generate_token
		begin
			self[:auth_token] = SecureRandom.urlsafe_base64
		end while User.exists?(:auth_token => self[:auth_token])
	end


	#regenerates token when needed
	def regenerate_auth_token
		self.auth_token = nil
		generate_token
		save!
	end
end
