Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  root  to:"products#index"
  #devise_scope :users do
  #  get '/users', to: redirect {"/users/sign_up"}
  # # 任意のルーティングをさせる
  #end
  
 # resources :users
  

end
