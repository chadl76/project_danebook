class SessionsController < ApplicationController


	def new
		@user = User.new
	end

	def create
		@user = User.find_by_email(params[:email])
		if @user && @user.authenticate(params[:password])
			if params[:remember_me]
				permanent_sign_in(@user)
			else
				sign_in(@user)
			end
			flash[:success] = "You've successfully signed in"
			redirect_to about_path
		else
			flash.now[:error] = "We couldn't sign you in "
			redirect_to root_url
		end
	end
end
