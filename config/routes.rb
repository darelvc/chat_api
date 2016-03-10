Rails.application.routes.draw do
  namespace :api do
    resources :chats, only: [:index, :show, :create, :update] do
      resources :messages, only: [:index, :show, :create]
    end
    resources :users, only: [:index, :show, :create]
    resource :session, only: [:create, :destroy]
  end
end
