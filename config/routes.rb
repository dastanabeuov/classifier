Rails.application.routes.draw do
  root 'front_pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'oauth_callbacks' }
  
  use_doorkeeper

  mount ActionCable.server => '/cable'
  
  authenticate :user, ->(u) { u.admin? || u.paid_user? } do
    mount SwaggerUiEngine::Engine, at: '/api_docs'
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end

  namespace :api do
    namespace :v1 do
      resources :profiles, only: :index do
        get :me, on: :collection
      end

      resources :activities do
      end

      resources :xroots do
        resources :xcategories do
          resources :xclasses do
          end
        end
      end
    end
  end

  resources :xroots do
    get :xcategories_xcategory, on: :member
    patch :update_inline, on: :member

    resources :xcategories, except: :index do
      get :xcategories_sub_xclasses, on: :member
      post :import, on: :member
      patch :update_inline, on: :member

      resources :xclasses, except: :index do
        get :xcategories_sub_children, on: :member
        get :xcategories_sub_child, on: :member
        get :xclass_children, on: :member
        get :xclass_child, on: :member
        patch :update_inline, on: :member
      end
    end
  end

  resources :activities
  resources :properties, only: %i[create update destroy]

  get 'front_pages/feedback'
  get 'front_pages/service'
  get 'front_pages/help'
  get 'front_pages/contact'
end
