class CommentsController < ApplicationController
	def new
		@comment = Comment.new
	end

	def create
		@post = Post.find(params[:post_id])
		#@user = User.find(params[:id])
		@comment = @post.comments.build(comment_params)
		if @comment.save!
			redirect_to user_timeline_path(@post, @comment)
		end
	end

	private

	def comment_params
		params.require(:comment).permit(
									:id,
									:user_id,
									:post_id,
									:body)
	end
end
