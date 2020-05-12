require 'rails_helper'

RSpec.describe XrootsController, type: :controller do
  describe 'Get #index' do
  	#GLOBAL DATABASE SOME
  	let(:xroots) { create_list(:xroot, 3) }

  	#GLOBAL method GET all tests
  	before { get :index }

  	it 'populates an array of all Xroots' do
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
end
