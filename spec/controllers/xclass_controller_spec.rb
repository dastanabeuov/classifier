require 'rails_helper'

RSpec.describe XclassesController, type: :controller do
  let(:xclass) { create(:xclass) }
  
  describe 'GET #index' do
  	#GLOBAL DATABASE SOME
  	let(:xclasses) { create_list(:xclass, 3) }

  	#GLOBAL method GET all tests
  	before { get :index }

  	it 'All Xclasses' do
  	  #xclass1 = FactoryBot.create(:xclass)
  	  #xclass2 = FactoryBot.create(:xclass)
  	  #xclasses = FactoryBot.create_list(:xclass, 3)
  	  #ADD FACTORYBOT SYNTAX METHODS RAILS HELPER SPECS
  	  #xclasses = create_list(:xclass, 3)

  	  #get :index

  	  #expect(assigns(:xclasses)).to match_array([xclass1, xclass2])
  	  expect(assigns(:xclasses)).to match_array(xclasses)
  	end

  	it 'render index view' do
      #get :index
      expect(response).to render_template :index
  	end
  end

  ###############################################
  describe 'GET #show' do
  	before { get :show, params: { id: xclass } }

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
  	before { get :edit, params: { id: xclass } }

  	it 'render edit view' do
      expect(response).to render_template :edit
  	end
  end

  describe 'POST #create' do
  	context 'width valid attributes' do
  	  it 'request and save xclass' do
  	  	#count = Xclass.count
  	  	#post :create, params: { xclass: { name: 'Name', description: 'Description' } }
  	  	#FactoryBot attributes_for(:xclass)
  	  	#post :create, params: { xclass: attributes_for(:xclass) }
  	    #expect(Xclass.count).to eq count + 1
  	  	#SUGAR syntacis
  	  	expect { post :create, params: { xclass: attributes_for(:xclass) } }.to change(Xclass, :count).by(1) 	    
  	  end

  	  it 'redirect create xclass' do
  	  	post :create, params: { xclass: attributes_for(:xclass) }
  	  	expect(response).to redirect_to assigns(:xclass)
  	  end
  	end

  	context 'width invalid attributes' do
  	  it 'does not save xclass' do
  	    expect { post :create, params: { xclass: attributes_for(:xclass, :invalid_class) } }.to_not change(Xclass, :count)
  	  end

  	  it 'render new view' do
  	  	post :create, params: { xclass: attributes_for(:xclass, :invalid_class) }
  	  	expect(response).to render_template :new
  	  end 	  
  	end
  end

  describe 'PATCH #update' do
  	context 'width valid attributes' do
  	  it 'request xclass' do
  	    patch :update, params: { id: xclass, xclass: attributes_for(:xclass) }
  	    expect(assigns(:xclass)).to eq xclass
  	  end

  	  it 'change attributes xclass' do
  	  	patch :update, params: { id: xclass, xclass: { name: 'TestName', description: 'TestDescription' } }
  	    xclass.reload
  	    expect(xclass.name).to eq 'TestName'
  	    expect(xclass.description).to eq 'TestDescription'
  	  end

  	  it 'redirect update xclass' do
  	  	patch :update, params: { id: xclass, xclass: attributes_for(:xclass) }
  	  	expect(response).to redirect_to xclass
  	  end
  	end

  	context 'width invalid attributes' do
  	  before { patch :update, params: { id: xclass, xclass: attributes_for(:xclass, :invalid_class) } }

  	  it 'does not change xclass' do
  	  	xclass.reload

  	    expect(xclass.name).to eq 'Name'
  	    expect(xclass.description).to eq 'Description'
  	  end

  	  it 'render edit view' do
  	  	expect(response).to render_template :edit
  	  end
  	end
  end

  describe 'DELETE #destroy' do
  	let!(:xclass) { create(:xclass) }

    it 'delete the xclass' do
      expect { delete :destroy, params: { id: xclass } }.to change(Xclass, :count).by(-1)
    end

    it 'redirect_to index view' do
      delete :destroy, params: { id: xclass }
      expect(response).to redirect_to xclasses_path
    end
  end

end
