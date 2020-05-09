Rails.application.routes.draw do
  #########################
  root 'front_pages#home'
  get 'front_pages/service'
  get 'front_pages/help'
  get 'front_pages/contact'
  #########################
  
  ##############################################
  mount SwaggerUiEngine::Engine, at: "/api_docs"
  ##############################################

  #######################################################
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  #######################################################

  ######################
  resources :xroots do
    resources :properties
    resources :xcategories do
      resources :properties
      resources :xclasses do
        resources :properties
      end
    end
  end
  ######################
end
