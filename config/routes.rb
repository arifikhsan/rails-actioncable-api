Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :notes, defaults: { format: :json }
  mount ActionCable.server => '/cable'
end
