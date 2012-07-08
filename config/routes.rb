Chatter::Application.routes.draw do
  resources :messages, only: [:index, :create, :show]
  match 'pusher/auth' => 'pusher#auth', via: :post

  root to: 'messages#index'
end
