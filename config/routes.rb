Rails.application.routes.draw do
  # Ruta de inicio de sesión (sign in)
  # devise_scope :user do
  #   root to: "users/sessions#new"
  # end
  
  get '/contact', to: 'contact#index'
  
  # Rutas para los controladores de Devise
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  devise_scope :user do
    get '/profile', to: 'users/registrations#show', as: 'user_profile'
  end

  # Ruta para mostrar los postulantes
  get '/applicants', to: 'applicants#index', as: 'applicants'

  # Rutas fuera de la restricción esteban
  resources :applications, only: [:index, :new, :create, :destroy]

  # Rutas dentro de la restricción esteban
  constraints lambda { |req| req.env['warden'].user&.esteban? } do
    resources :job_offers, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :applications, only: [:index, :create, :destroy, :new]
    end
    resources :users, only: [:new, :create, :update]
    resources :applicants, only: [:index]

    get '/users', to: 'users/registrations#index', as: 'user_index'
  end

  

  # Ruta para las ofertas laborales para usuarios normales
  resources :job_offers, only: [:index], constraints: lambda { |req| req.env['warden'].user&.normal? }
  resources :users, only: [:show]

  root "home#index"
end
