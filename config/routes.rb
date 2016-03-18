Rails.application.routes.draw do
  namespace :api do
    concern :votable do
      post :vote, to: 'votes#create'
    end

    resources :chats, only: [:index, :show, :create, :update], shallow: true do
      resources :messages, only: [:index, :create] do
        concerns :votable
      end

      resources :pings, only: [:index, :create] do
        concerns :votable
      end

      resources :pictures, only: [:index, :create] do
        concerns :votable
      end
    end

    resources :users, only: [:index, :show, :create]

    resource :profile, only: [:show, :update] do
      resource :avatar, only: :update
    end

    resource :session, only: [:create, :destroy]
  end
end
