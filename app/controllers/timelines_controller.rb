class TimelinesController < ApplicationController

	def show
		@post = Post.new(user_id: params[:user_id])
		@user = User.find_by!(params[:id])
		
	end
end
