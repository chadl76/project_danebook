class Profile < ApplicationRecord
	belongs_to :user, :inverse_of => :profile, optional: true
	
end
