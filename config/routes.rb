Rails.application.routes.draw do
  resources :xroots do
    resources :properties
    resources :xcategories do
      resources :properties
      resources :xclasses do
        resources :properties
      end
    end
  end
  #########################
  root 'front_pages#home'
  get 'front_pages/service'
  get 'front_pages/help'
  get 'front_pages/contact'
  #########################

  namespace :api, defaults: {format: 'json' } do
    namespace :v1 do
      resources :xroots do
        resources :xcategories do
          resources :xclasses do
          end        
        end
      end
    end
  end

  #######################################################
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  #######################################################
end
