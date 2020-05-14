require 'rails_helper'

RSpec.describe XrootsController, type: :controller do
  let(:xroot) { create(:xroot) }
  
  describe 'GET #index' do
  	#GLOBAL DATABASE SOME
  	let(:xroots) { create_list(:xroot, 3) }

  	#GLOBAL method GET all tests
  	before { get :index }

  	it 'All Xroots' do
  	  #xroot1 = FactoryBot.create(:xroot)
  	  #xroot2 = FactoryBot.create(:xroot)
  	  #xroots = FactoryBot.create_list(:xroot, 3)
  	  #ADD FACTORYBOT SYNTAX METHODS RAILS HELPER SPECS
  	  #xroots = create_list(:xroot, 3)

  	  #get :index

  	  #expect(assigns(:xroots)).to match_array([xroot1, xroot2])
  	  expect(assigns(:xroots)).to match_array(xroots)
  	end

  	it 'render index view' do
      #get :index
      expect(response).to render_template :index
  	end
  end

  ###############################################
  describe 'GET #show' do
  	before { get :show, params: { id: xroot } }

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
  	before { get :edit, params: { id: xroot } }

  	it 'render edit view' do
      expect(response).to render_template :edit
  	end
  end

  describe 'POST #create' do
  	context 'width valid attributes' do
  	  it 'request and save xroot' do
  	  	#count = Xroot.count
  	  	#post :create, params: { xroot: { name: 'Name', description: 'Description' } }
  	  	#FactoryBot attributes_for(:xroot)
  	  	#post :create, params: { xroot: attributes_for(:xroot) }
  	    #expect(Xroot.count).to eq count + 1
  	  	#SUGAR syntacis
  	  	expect { post :create, params: { xroot: attributes_for(:xroot) } }.to change(Xroot, :count).by(1)  	    
  	  end

  	  it 'redirect create xroot' do
  	  	post :create, params: { xroot: attributes_for(:xroot) }
  	  	expect(response).to redirect_to assigns(:xroot)
  	  end
  	end

  	context 'width invalid attributes' do
  	  it 'does not save xroot' do
  	    expect { post :create, params: { xroot: attributes_for(:xroot, :invalid_root) } }.to_not change(Xroot, :count)
  	  end

  	  it 'render new view' do
  	  	post :create, params: { xroot: attributes_for(:xroot, :invalid_root) }
  	  	expect(response).to render_template :new
  	  end 	  
  	end
  end

  describe 'PATCH #update' do
  	context 'width valid attributes' do
  	  it 'request xroot' do
  	    patch :update, params: { id: xroot, xroot: attributes_for(:xroot) }
  	    expect(assigns(:xroot)).to eq xroot
  	  end

  	  it 'change attributes xroot' do
  	  	patch :update, params: { id: xroot, xroot: { name: 'TestName', description: 'TestDescription' } }
  	    xroot.reload
  	    expect(xroot.name).to eq 'TestName'
  	    expect(xroot.description).to eq 'TestDescription'
  	  end

  	  it 'redirect update xroot' do
  	  	patch :update, params: { id: xroot, xroot: attributes_for(:xroot) }
  	  	expect(response).to redirect_to xroot
  	  end
  	end

  	context 'width invalid attributes' do
  	  before { patch :update, params: { id: xroot, xroot: attributes_for(:xroot, :invalid_root) } }

  	  it 'does not change xroot' do
  	  	xroot.reload

  	    expect(xroot.name).to eq 'Name'
  	    expect(xroot.description).to eq 'Description'
  	  end

  	  it 'render edit view' do
  	  	expect(response).to render_template :edit
  	  end
  	end
  end

  describe 'DELETE #destroy' do
  	let!(:xroot) { create(:xroot) }

    it 'delete the xroot' do
      expect { delete :destroy, params: { id: xroot } }.to change(Xroot, :count).by(-1)
    end

    it 'redirect_to index view' do
      delete :destroy, params: { id: xroot }
      expect(response).to redirect_to xroots_path
    end
  end

end
