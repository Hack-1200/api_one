Rails.application.routes.draw do
	mount Battle::MyApi => '/'
	mount GrapeSwaggerRails::Engine => '/swagger'
	namespace :admin do
		  # get  '/login', to: 'sessions#new'
		  # post '/login', to: 'sessions#create'
		  # delete '/logout', to: 'sessions#destroy'
		  # get '/signup', to: 'users#new'
		  resources :users
		  resources :posts
		  root 'pages#adminhome'
	end
	get  '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'
	get '/signup', to: 'users#new'
	resources :users, except:[:edit, :update]
	root 'pages#home'


end
