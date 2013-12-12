Heyoo::Application.routes.draw do
  resources :users
  resources :contents
  resources :sessions, only: [:create, :new, :destroy]

  root "contents#index"

  get "splash", :to => "splash#index", :as => "splash"

  get "logout", :to => "sessions#destroy", :as => "logout"
  get "login", :to => "sessions#new", :as => "login"
  get "signup", :to => "users#new", :as => "signup"
  get "post", :to => "contents#new", :as => "post"

  post '/contents/create_reply', controller: 'contents', action: 'create_reply'
  resources :messages
  

end
