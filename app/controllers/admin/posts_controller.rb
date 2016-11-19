module Admin
	class PostsController < Admin::ApplicationController
		def index
			@posts = Post.all
		end

		def new
			@post = Post.new
		end

		def create
			post=Post.new(params[:post])
		end

		def destroy

		end
	end
end