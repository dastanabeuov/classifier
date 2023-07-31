# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  # devise_for :users, skip: [:session, :password, :registration],
  #         controllers: { omniauth_callbacks: 'oauth_callbacks' }

  # scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
  root 'front_pages#home'
  get :search, to: 'search#index'

  # devise_for :users, skip: [:omniauth_callbacks]

  devise_for :users, controllers: { omniauth_callbacks: 'oauth_callbacks' }

  resources :xroots do
    get :xroot_xcategories, on: :member
    patch :update_inline, on: :member

    resources :xcategories, except: :index do
      get :xcategory_xclasses, on: :member

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
  # end

  namespace :api do
    namespace :v1 do
      resources :xroots do
        resources :xcategories do
          resources :xclasses do
          end
        end
      end

      resources :activities

      resources :profiles, only: :index do
        get :me, on: :collection
      end
    end
  end

  mount ActionCable.server => '/cable'

  authenticate :user, lambda { |u| u.admin? || u.paid_user? || u.email == 'web.dev.adk@gmail.com' } do
    mount Rswag::Ui::Engine => '/api-docs'
    mount Rswag::Api::Engine => '/api-docs'
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

    mount Sidekiq::Web => '/sidekiq'
  end

  use_doorkeeper
end
