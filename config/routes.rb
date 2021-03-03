Rails.application.routes.draw do
  root 'front_pages#home'

  get 'front_pages/service'
  get 'front_pages/help'
  get 'front_pages/contact'

  mount SwaggerUiEngine::Engine, at: "/api_docs"

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  resources :xroots do
    resources :xcategories do
      resources :xclasses do
      end
    end
  end

  resources :properties
  resources :activities
end