class PostsController < ApplicationController
	def create
		@user = User.find_by!(params[:id])
		@post = @user.posts.build(post_params)
	

		if @post.save!
			#redirect_to user_timeline_path(@user, @post)
			redirect_to user_timeline_path(@post, @user)
		end	
	end


	def show
		@user = User.find_by!(params[:user_id])
		@post = Post.find(params[:id])
	end

	private

	def post_params
		params.require(:post).permit(
								:id,
								:title,
								:body,
								:user_id)
	end

end
