Rails.application.routes.draw do
  namespace :api do
    concern :votable do
      post :vote, to: 'votes#create'
    end

    resources :chats, only: [:index, :show, :create, :update] do
      resources :messages, only: [:index, :create]

      resources :pings, only: [:index, :create]
    end

    resources :messages, only: [] do
      concerns :votable
    end

    resources :pings, only: [] do
      concerns :votable
    end

    resources :users, only: [:index, :show, :create]

    resource :profile, only: [:show, :update]

    resource :session, only: [:create, :destroy]
  end
end
