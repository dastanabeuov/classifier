Rails.application.routes.draw do
  resources :xroots
  resources :xcategories
  resources :xclasses
  
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
