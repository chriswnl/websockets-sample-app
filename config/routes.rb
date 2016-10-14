Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
    
  resources :chatrooms, param: :slug
  resources :messages

  root to: "chatrooms#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
