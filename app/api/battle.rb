module Battle
  class MyApi < Grape::API
    format :json
    prefix :api
    version 'v1'

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
