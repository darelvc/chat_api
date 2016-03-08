Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    resources :chats, only: [:index, :show, :create] do
      resources :messages
    end
    resources :users, only: [:index, :show, :create]
    resource :session, only: [:create, :destroy]
  end
end
