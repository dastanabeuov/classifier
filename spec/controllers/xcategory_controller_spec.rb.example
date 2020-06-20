require 'rails_helper'

RSpec.describe XcategoriesController, type: :controller do
  let(:xcategory) { create(:xcategory) }
  
  describe 'GET #index' do
  	#GLOBAL DATABASE SOME
  	let(:xcategories) { create_list(:xcategory, 3) }

  	#GLOBAL method GET all tests
  	before { get :index }

  	it 'All Xcategories' do
  	  #xcategory1 = FactoryBot.create(:xcategory)
  	  #xcategory2 = FactoryBot.create(:xcategory)
  	  #xcategories = FactoryBot.create_list(:xcategory, 3)
  	  #ADD FACTORYBOT SYNTAX METHODS RAILS HELPER SPECS
  	  #xcategories = create_list(:xcategory, 3)

  	  #get :index

  	  #expect(assigns(:xcategories)).to match_array([xcategory1, xcategory2])
  	  expect(assigns(:xcategories)).to match_array(xcategories)
  	end

  	it 'render index view' do
      #get :index
      expect(response).to render_template :index
  	end
  end

  ###############################################
  describe 'GET #show' do
  	before { get :show, params: { id: xcategory } }

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
  	before { get :edit, params: { id: xcategory } }

  	it 'render edit view' do
      expect(response).to render_template :edit
  	end
  end

  describe 'POST #create' do
  	context 'width valid attributes' do
  	  it 'request and save xcategory' do
  	  	#count = Xcategory.count
  	  	#post :create, params: { xcategory: { name: 'Name', description: 'Description' } }
  	  	#FactoryBot attributes_for(:xcategory)
  	  	#post :create, params: { xcategory: attributes_for(:xcategory) }
  	    #expect(Xcategory.count).to eq count + 1
  	  	#SUGAR syntacis
  	  	expect { post :create, params: { xcategory: attributes_for(:xcategory) } }.to change(Xcategory, :count).by(1)  	    
  	  end

  	  it 'redirect create xcategory' do
  	  	post :create, params: { xcategory: attributes_for(:xcategory) }
  	  	expect(response).to redirect_to assigns(:xcategory)
  	  end
  	end

  	context 'width invalid attributes' do
  	  it 'does not save xcategory' do
  	    expect { post :create, params: { xcategory: attributes_for(:xcategory, :invalid_category) } }.to_not change(Xcategory, :count)
  	  end

  	  it 'render new view' do
  	  	post :create, params: { xcategory: attributes_for(:xcategory, :invalid_category) }
  	  	expect(response).to render_template :new
  	  end 	  
  	end
  end

  describe 'PATCH #update' do
  	context 'width valid attributes' do
  	  it 'request xcategory' do
  	    patch :update, params: { id: xcategory, xcategory: attributes_for(:xcategory) }
  	    expect(assigns(:xcategory)).to eq xcategory
  	  end

  	  it 'change attributes xcategory' do
  	  	patch :update, params: { id: xcategory, xcategory: { name: 'TestName', description: 'TestDescription' } }
  	    xcategory.reload
  	    expect(xcategory.name).to eq 'TestName'
  	    expect(xcategory.description).to eq 'TestDescription'
  	  end

  	  it 'redirect update xcategory' do
  	  	patch :update, params: { id: xcategory, xcategory: attributes_for(:xcategory) }
  	  	expect(response).to redirect_to xcategory
  	  end
  	end

  	context 'width invalid attributes' do
  	  before { patch :update, params: { id: xcategory, xcategory: attributes_for(:xcategory, :invalid_category) } }

  	  it 'does not change xcategory' do
  	  	xcategory.reload

  	    expect(xcategory.name).to eq 'Name'
  	    expect(xcategory.description).to eq 'Description'
  	  end

  	  it 'render edit view' do
  	  	expect(response).to render_template :edit
  	  end
  	end
  end

  describe 'DELETE #destroy' do
  	let!(:xcategory) { create(:xcategory) }

    it 'delete the xcategory' do
      expect { delete :destroy, params: { id: xcategory } }.to change(Xcategory, :count).by(-1)
    end

    it 'redirect_to index view' do
      delete :destroy, params: { id: xcategory }
      expect(response).to redirect_to xcategories_path
    end
  end

end
