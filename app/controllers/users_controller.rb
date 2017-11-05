class UsersController < ApplicationController

skip_before_action :require_login, :only => [:new, :create]

	def index
	end

	def about
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "User created successfully."
			redirect_to users_path
		else
			flash.now[:error] = "Failed to create user."
			render :new
		end
	end

	private

	def user_params
		params.require(:user).permit(
							  :first_name, 
							  :last_name, 
							  :email, 
							  :password, 
							  :password_confirmation)
	end
end
