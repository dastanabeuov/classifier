RailsAdmin.config do |config|
  ##Set Locales
  I18n.default_locale = :ru
  I18n.available_locales = [:ru, :kz, :en]   
  ########################################

  ##Base configuration dashboard
  config.actions do    
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    ## With an audit adapter, you can add:
    # history_index
    # history_show

    ## Sortable nestable action for each model
    nestable do
      visible do
        %w(Xcategory Xclass).include? bindings[:abstract_model].model_name
      end
    end     
  end
  ########################################################################

  ##Neslable atrributes setting
  config.model 'Xcategory' do
    nestable_list true
  end

  config.model 'Xclass' do
    nestable_tree({
      position_field: :position,
      max_depth: 999
    })
  end 
  ##############################    

  ##Display show atributes models
  config.model 'Xroot' do  
    list do
      field :id
      field :name
      field :description
    end
  end

  config.model 'Xcategory' do
    list do
      field :id
      field :name
      field :description
    end
  end

  config.model 'Xclass' do    
    list do
      field :id
      field :name
      field :description
    end
  end

  config.model 'Property' do
    list do
      field :id
      field :propertyable_type
      field :content
    end
  end

  config.model 'User' do
    list do
      field :id
      field :email
      field :admin
      field :moderator
      field :paid_user
      field :guest
    end
  end
  ############################

  ### Popular gems integration  
  ## == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :user
   end
   config.current_user_method(&:current_user)
  ###########################################

  ## == CancanCan ==
  config.authorize_with :cancancan
  ################################

  ## == Globalize ==
  translated_models = ['Xroot', 'Xcategory', 'Xclass', 'Property']
  config.included_models = ["User"].concat(translated_models.map{|model| [model, "#{model}::Translation"]}.flatten)
  #################################################################################################################

  ## == Globalize Translated Fields ==
  translated_models.each do |model|
    config.model model do
      configure :translations, :globalize_tabs
    end
    config.model "#{model}::Translation" do
      visible false
      configure :locale, :hidden do
        help ''
      end
      include_fields :locale, *Object.const_get(model).translated_attribute_names
    end
  end
  ###############################################################################
end
