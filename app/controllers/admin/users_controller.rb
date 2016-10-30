class UsersController < ApplicationController
	before_action :logged_in_user, only: [:show]

	def new
		@user = User.new
	end

	def show 
		# if logged_in? && ((user_id=params[:id]) == current_user.id)
			@user = User.find(params[:id])
		# else
		# 	flash[:danger]="Please Log in!"
		# 	redirect_to login_path
		# end
	end

	def create
		@user = User.new(user_params)
		if @user.save
			 flash[:success] = "Welcome to the Sample App!"
			 log_in(@user)
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id]) 
	end

	private

	def user_params
		params.require(:user).permit(:name,:email,:password,:password_confrmation)
	end

	def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
