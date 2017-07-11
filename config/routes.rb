Rails.application.routes.draw do
  get 'profiles' => 'profiles#index'
  get 'profiles/:id' => 'profiles#show', as: :profile

  resources :tweets do
    resource :likes, only: [:create, :destroy]
  end

  resources :relationships


  devise_for :users

  root 'tweets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
