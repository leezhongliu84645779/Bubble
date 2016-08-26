Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :chatrooms
  root "firstpages#index"
  resources :forums
  resources :users, only: [:index, :create]
  resources :sessions, only: [:index, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :homes, only: [:index, :create]
  scope '/homes' do
    resources :profiles, only: [:index, :create]
  end
  get '/forumsearch', to: "forums#search", as: 'search_forum'
  resources :firstpages
  resources :chatrooms do
    resources :chatroom_users
    resources :messages
  end

end
