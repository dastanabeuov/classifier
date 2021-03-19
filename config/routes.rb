Rails.application.routes.draw do
  root 'front_pages#home'

  devise_for :users

  resources :xroots do
    resources :xcategories, except: :index do
      resources :xclasses, except: :index do
      end
    end
  end

  resources :activities
  resources :properties, only: %i[create update destroy]

  get 'front_pages/service'
  get 'front_pages/help'
  get 'front_pages/contact'

  mount SwaggerUiEngine::Engine, at: "/api_docs"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end