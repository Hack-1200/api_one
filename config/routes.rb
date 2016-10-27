Rails.application.routes.draw do
  root 'pages#home'
  resource :users, except: :destroy

end
