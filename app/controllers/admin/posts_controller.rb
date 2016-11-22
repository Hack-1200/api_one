module Admin
	class PostsController < Admin::ApplicationController
		def index
			@posts = Post.all
		end

		def new
			@post = Post.new

		end

		def create
			@post=Post.new(user_params)
			if @post.save
				flash[:succes] = "New post has added"
			else
				flash[:error] = "Some errors"
			end
			# params[:post]

		end

		def destroy
			post = Post.find(params[:id])
			if post && current_user.admin?
				post.destroy
				flash[:success] = "Post deleted succes!"
			else
				flash[:error] = "Error!"
			end
			redirect_to admin_users_url
		end

		private

		def user_params
    	params.require(:post).permit(:sub_id, :lev_id, :body, :answer)
  	end
	end
end
