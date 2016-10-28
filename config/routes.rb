Rails.application.routes.draw do
  root 'pages#home'
  resources :users, except: :destroy

end
