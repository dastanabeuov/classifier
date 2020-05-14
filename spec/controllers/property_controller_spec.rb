require 'rails_helper'

RSpec.describe PropertiesController, type: :controller do
  let(:property) { create(:property) }
  
  describe 'GET #index' do
  	#GLOBAL DATABASE SOME
  	let(:properties) { create_list(:property, 3) }

  	#GLOBAL method GET all tests
  	before { get :index }

  	it 'All properties' do
  	  #property1 = FactoryBot.create(:property)
  	  #property2 = FactoryBot.create(:property)
  	  #properties = FactoryBot.create_list(:property, 3)
  	  #ADD FACTORYBOT SYNTA METHODS RAILS HELPER SPECS
  	  #properties = create_list(:property, 3)

  	  #get :index

  	  #expect(assigns(:properties)).to match_array([property1, property2])
  	  expect(assigns(:properties)).to match_array(properties)
  	end

  	it 'render index view' do
      #get :index
      expect(response).to render_template :index
  	end
  end

  ###############################################
  describe 'GET #show' do
  	before { get :show, params: { id: property } }

  	it 'render show view' do
      expect(response).to render_template :show
  	end
  end

  ##################################################
  describe 'GET #new' do
  	before { get :new }

  	it 'render new view' do
  	  expect(response).to render_template :new
  	end
  end

  ###############################################
  describe 'GET #edit' do
  	before { get :edit, params: { id: property } }

  	it 'render edit view' do
      expect(response).to render_template :edit
  	end
  end

  describe 'POST #create' do
  	context 'width valid attributes' do
  	  it 'request and save property' do
  	  	#count = property.count
  	  	#post :create, params: { property: { propertyable_type: 'Xroot', propertyable_id: '1' } }
  	  	#FactoryBot attributes_for(:property)
  	  	#post :create, params: { property: attributes_for(:property) }
  	    #expect(property.count).to eq count + 1
  	  	#SUGAR syntacis
  	  	expect { post :create, params: { property: attributes_for(:property) } }.to change(Property, :count).by(1)  	    
  	  end

  	  it 'redirect create property' do
  	  	post :create, params: { property: attributes_for(:property) }
  	  	expect(response).to redirect_to assigns(:property)
  	  end
  	end

  	context 'width invalid attributes' do
  	  it 'does not save property' do
  	    expect { post :create, params: { property: attributes_for(:property, :invalid_property) } }.to_not change(Property, :count)
  	  end

  	  it 'render new view' do
  	  	post :create, params: { property: attributes_for(:property, :invalid_property) }
  	  	expect(response).to render_template :new
  	  end 	  
  	end
  end

  describe 'PATCH #update' do
  	context 'width valid attributes' do
  	  it 'request property' do
  	    patch :update, params: { id: property, property: attributes_for(:property) }
  	    expect(assigns(:property)).to eq property
  	  end

  	  it 'change attributes property' do
  	  	patch :update, params: { id: property, property: { propertyable_type: 'Category', propertyable_id: 1 } }
  	    property.reload
  	    expect(property.propertyable_type).to eq 'Category'
  	    expect(property.propertyable_id).to eq 1
  	  end

  	  it 'redirect update property' do
  	  	patch :update, params: { id: property, property: attributes_for(:property) }
  	  	expect(response).to redirect_to property
  	  end
  	end

  	context 'width invalid attributes' do
  	  before { patch :update, params: { id: property, property: attributes_for(:property, :invalid_property) } }

  	  it 'does not change property' do
  	  	property.reload

  	    expect(property.propertyable_type).to eq 'Xroot'
  	    expect(property.propertyable_id).to eq 1
  	  end

  	  it 'render edit view' do
  	  	expect(response).to render_template :edit
  	  end
  	end
  end

  describe 'DELETE #destroy' do
  	let!(:property) { create(:property) }

    it 'delete the property' do
      expect { delete :destroy, params: { id: property } }.to change(Property, :count).by(-1)
    end

    it 'redirect_to index view' do
      delete :destroy, params: { id: property }
      expect(response).to redirect_to properties_path
    end
  end

end
