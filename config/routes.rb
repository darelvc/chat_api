Rails.application.routes.draw do
  namespace :api do
    resources :chats, only: [:index, :show, :create, :update] do
      resources :messages
    end
    resources :users, only: [:index, :show, :create]
    resource :session, only: [:create, :destroy]
  end
end
