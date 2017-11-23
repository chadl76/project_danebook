class UsersController < ApplicationController
before_filter :authenticate_user!, :except => [:new, :create]
#skip_before_action :require_login, :only => [:new, :show]

	def index
	end

	def about
	end

	def new
		@user = User.new
		@user.build_profile

	end

	def create
		@user = User.new(user_params)
		if @user.save!
			flash[:success] = "User created successfully."

			redirect_to user_timeline_path(@user)
		else
			@user.build_profile
			flash.now[:error] = "Failed to create user."
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def show
		@user = User.find(params[:id])
	end


	def update
		@user = User.find(params[:id])
		@user.update(user_params)

		if @user.update(user_params)
			redirect_to about_path
		else
			render :edit
		end
	end

	private

	def user_params
		params.require(:user).permit(
							  :first_name, 
							  :last_name, 
							  :email, 
							  :password, 
							  :password_confirmation, 
							   :profile_attributes => [
							   	:id,
							   	:user_id,
							  	:birthday,
							  	:college,
							  	:hometown,
							  	:currently_live,
							  	:phone_number,
							  	:words_to_live_by,
							  	:about_me ])
	end


	def profile_params
		params.require(:user).permit(
								:id,
								:user_id,
							  	:birthday,
							  	:college,
							  	:hometown,
							  	:currently_live,
							  	:phone_number,
							  	:words_to_live_by,
							  	:about_me)
	end


	

end
