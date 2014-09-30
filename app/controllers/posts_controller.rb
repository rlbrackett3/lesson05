class PostsController < ApplicationController
	def index
		@posts = Post.all # many posts
	end
	def new
		@post = Post.new
	end
	def show
		@post = Post.find(params[:id])
	end
	def create

		@post = Post.new(post_params)
		@post.save # this should be a conditional: if @post.save...end
		redirect_to post_path(@post)
		# end
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.destroy
			flash[:notice] = "Post deleted!"
		else
			flash[:alert] = "There was a problem deleting the post."
		end
		redirect_to posts_path
	end

	def edit
		@post = Post.find(params[:id])
	end




	def update
        @post = Post.find(params[:id])
        if @post.update(params[:post])
			flash[:notice] = "post successfully updated!"
			redirect_to post_path @post
		else
			flash[:alert] = "post not updated, sorry."
			redirect_to edit_post_path
		end
	end	

	private

	def post_params
		params.require(:post).permit(:title, :text)
	end







	# def current_user
	#   		if session[:user_id]
	#     @current_user = User.find(session[:user_id])

	#         end
 #    end
end
