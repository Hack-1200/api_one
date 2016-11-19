module Admin
	class Admin::PagesController < Admin::ApplicationController
		
		# layout :admin_controller
		def adminhome
			@users = User.all
			@posts = Post.all
		end
	end
end