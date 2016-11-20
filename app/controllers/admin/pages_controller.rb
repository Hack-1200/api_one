module Admin
	class Admin::PagesController < Admin::ApplicationController
		before_action :admin_user
		# layout :admin_controller
		def adminhome
			@users = User.all
			@posts = Post.all
		end

		
	end
end
