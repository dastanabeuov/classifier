# frozen_string_literal: true

RailsAdmin.config do |config|
  config.asset_source = :sprockets
  # ##Set Locales
  I18n.default_locale = :ru
  I18n.available_locales = %i[ru kz en]

  # ##Base configuration dashboard
  config.actions do
    dashboard # mandatory
    index # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    # history_index
    # history_show

    ## Sortable nestable action for each model
    nestable do
      visible do
        %w[Xclass Activity].include? bindings[:abstract_model].model_name
      end
    end
  end

  # ##Neslable atrributes setting
  config.model 'Xclass' do
    nestable_tree({ position_field: :position, max_depth: 999 })
  end

  config.model 'Activity' do
    nestable_tree({ position_field: :position, max_depth: 999 })
  end

  # ##Display show atributes models
  # config.model 'Xclass' do
  #   list do
  #     field :id
  #     field :title
  #     field :description
  #     field :user do
  #       searchable :email
  #       pretty_value do
  #         value.try(:email)
  #       end
  #     end
  #     field :properties do
  #       searchable :title
  #       pretty_value do
  #         value.try(:title)
  #       end
  #     end
  #     field :created_at
  #     field :updated_at
  #   end
  # end

  config.model 'Xclass' do
    list do
      field :id
      field :title
      field :description
    end
  end

  config.model 'Activity' do
    list do
      field :id
      field :title
      field :description
    end
  end

  config.model 'User' do
    list do
      field :id
      field :email
      field :role
    end
  end

  # ##Devise gems integration

  config.authenticate_with do
    warden.authenticate! scope: :user
  end

  config.current_user_method(&:current_user)

  # ##CancanCan
  config.authorize_with :cancancan

  # ###Globalize
  # translated_models = ['Xroot', 'Xcategory', 'Xclass', 'Property', 'Activity']
  # config.included_models = ["User"].concat(translated_models.map{|model| [model, "#{model}::Translation"]}.flatten)

  # #== Globalize Translated Fields ==
  # translated_models.each do |model|
  #   config.model model do
  #     configure :translations, :globalize_tabs
  #   end
  #   config.model "#{model}::Translation" do
  #     visible false
  #     configure :locale, :hidden do
  #       help ''
  #     end
  #     include_fields :locale, *Object.const_get(model).translated_attribute_names
  #   end
  # end
end
