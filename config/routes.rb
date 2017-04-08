Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
  }
  resource :pin_codes

  get "create_pin_code"  => 'pin_codes#create_pin_code'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
