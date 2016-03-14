Rails.application.routes.draw do
  namespace :api do
    resources :chats, only: [:index, :show, :create, :update] do
      resources :messages, only: [:index, :create]
      resources :pings, only: [:index, :create]
    end

    resources :users, only: [:index, :show, :create]
    resource :profile, only: [:show, :update]
    resource :session, only: [:create, :destroy]
  end
end
