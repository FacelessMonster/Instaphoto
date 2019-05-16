Rails.application.routes.draw do
  resources :photos
  devise_for :users
  root 'pages#landing'
  get 'pages/about'
  get 'profiles/:id' => 'profiles#show', as: 'profile'
  get 'profiles/:id/subscribe' => 'profiles#subscribe', as: 'subscribe'
  get 'profiles/:id/unsubscribe' => 'profiles#unsubscribe', as: 'unsubscribe'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
