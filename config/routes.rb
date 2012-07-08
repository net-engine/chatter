Chatter::Application.routes.draw do
  resources :messages, only: [:index, :create, :show]

  root to: 'messages#index'
end
