Rails.application.routes.draw do
  resources :photos
  devise_for :users
  root 'pages#landing'
  get 'pages/about'
  get 'profiles/subscribes_list'
  get 'profiles/friends_photos'
  get 'profiles/my_photos'
  get 'profiles/:id' => 'profiles#show', as: 'profile'
  post 'profiles/:id/subscribe' => 'profiles#subscribe', as: 'subscribe'
  post 'profiles/:id/unsubscribe' => 'profiles#unsubscribe', as: 'unsubscribe'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
