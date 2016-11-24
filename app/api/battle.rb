require "./app/helpers/sessions_helper.rb"
module Battle
  class MyApi < Grape::API

    format :json
    prefix :api
    version 'v1'

    helpers do
        # session = {}
      include SessionsHelper
    #   def log_in(user)
    #     session = {}
    #  		session[:user_id] = user.id
    # 	end
    end


    resource :posts do
      get do
          posts = Post.all
          posts
      end
    end

    resource :users do
      get do
        users = User.all
        present users, with: Entities::Userg
      end

      get ':id' do
        user = User.find(params[:id])
        # present users, with: Entities::User
      end

      params do
        requires :user, type: Hash do
          requires :name, type: String
          requires :email, type: String
          requires :password, type: String
          requires :password_confirmation, type: String
        end
      end

      post do
        user = User.new(declared(params).user)
        if user.save
          present user, with: Entities::Userg
        end
      end
    end

    resource :sessions do
      params do
        requires :session, type: Hash do
          requires :email, type:String
          requires :password, type:String
        end
      end
      # binding.pry
      post do
        # p params
        # params = declared(params).user
        user=User.find_by(email: params[:session][:email].downcase)
      	if user && user.authenticate(params[:session][:password])
      	log_in(user)
      	dremember user
        user
      	# redirect_to user
      	else
      		flash.now[:danger]="Invalid email/password combination."
      	# 	render 'new'
      	end
      end
    end
    add_swagger_documentation(
      api_version: 'v1',
      hide_documentation_path: true,
      hide_format: true,
      info: {
        title: 'API Documentation'
      }
    )
  end
end
