require "./app/helpers/sessions_helper.rb"
module Battle
  class MyApi < Grape::API
    # include ActionController::Base
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
        begin
          users = User.all
        rescue
          users = "Error"
        end
        present users, with: Entities::Acdc

      end

      get ':id' do
        begin
          user = User.find(params[:id])
          present user, with: Entities::Rhcp
        rescue
          user = {
            succes: false,
            data:nil,
            error:{
              code:3,
              messsage: "No more users"
            }
          }
        end
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
        begin
          user = User.new(declared(params).user)

          if user.valid?
              user.save!
              present user, with: Entities::Soad
          else
              present user, with: Entities::Soad
          end
        rescue
          user = {
              success: false,
              data:nil,
              error:{
                code:5,
                message: "Something goes wrong in server"
              }
          }
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

      post do
        begin
          user=User.find_by(email: params[:session][:email].downcase)
        	if user && user.authenticate(params[:session][:password])
          	log_in(user)
          	dremember user
            present user, with: Entities::Rhcp, option: " "
          	# redirect_to user
        	else
            present user, with: Entities::Rhcp, option: "Invalid email/password combination."
        		# flash.now[:danger]="Invalid email/password combination."
        	# 	render 'new'
        	end
        rescue
          present user, with: Entities::Rhcp, option: "Invalid email/password combination."

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
