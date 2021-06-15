Rails.application.routes.draw do
  use_doorkeeper
  root 'front_pages#home'

  devise_for :users, controllers: { omniauth_callbacks: 'oauth_callbacks' }

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
    patch :update_inline, on: :member

    resources :xcategories, except: :index do
      post :import, on: :member
      patch :update_inline, on: :member

      resources :xclasses, except: :index do
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

  authenticate :user, ->(u) { u.admin? || u.paid_user? } do
    mount SwaggerUiEngine::Engine, at: '/api_docs'
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end

  mount ActionCable.server => '/cable'
end
