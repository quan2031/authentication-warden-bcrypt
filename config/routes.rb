Rails.application.routes.draw do
  get 'confirmations/show'
  get 'registrations/show'
  get 'registrations/new'
  get 'registrations/create'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
  	collection do
  		resource :registrations, only: [:show, :new, :create]
  		resource :sessions, only: [:new, :create, :destroy]
  		resource :confirmations, only: [:show]
  	end
  end
end
