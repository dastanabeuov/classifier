# frozen_string_literal: true

require 'rails_helper'

RSpec.describe XrootsController, type: :controller do
  let(:user) { create(:user) }
  let(:xroot) { create(:xroot, user: user) }

  before { login(user) }

  describe 'GET #INDEX' do
    let(:xroot_1) { create(:xroot, user: user) }
    let(:xroot_2) { create(:xroot, user: user) }

    before { get :index }

    it 'All xroots' do
      expect(assigns(:xroots)).to match_array([xroot_1, xroot_2])
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #SHOW' do
    before { get :show, params: { id: xroot } }

    it 'request show xroot' do
      expect(assigns(:xroot)).to eq xroot
    end

    it 'render show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #NEW' do
    before { get :new }

    it 'request new xroot' do
      expect(assigns(:xroot)).to be_a_new(Xroot)
    end

    it 'render new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #EDIT' do
    before { get :edit, params: { id: xroot } }

    it 'request edit xroot' do
      expect(assigns(:xroot)).to eq xroot
    end

    it 'render edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #CREATE' do
    context 'valid attribute' do
      it 'save new xroot' do
        count = Xroot.count
        post :create, params: { xroot: attributes_for(:xroot) }

        expect(Xroot.count).to eq count + 1
      end

      it 'redirect show view' do
        post :create, params: { xroot: attributes_for(:xroot) }

        expect(response).to redirect_to xroot_path(Xroot.last)
      end
    end

    context 'invalid attribute' do
      it 'is not save xroot' do
        count = Xroot.count
        post :create, params: { xroot: attributes_for(:xroot, :invalid) }

        expect(Xroot.count).to eq count
      end

      it 'render show new' do
        post :create, params: { xroot: attributes_for(:xroot, :invalid) }

        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #UPDATE' do
    context 'valid attribute' do
      it 'update xclass' do
        put :update, params: { id: xroot, xroot: attributes_for(:xroot) }

        expect(assigns(:xroot)).to eq xroot
      end

      it 'change xroot attribute' do
        patch :update, params: { id: xroot, xroot: attributes_for(:xroot, description: 'NewDescription') }
        xroot.reload

        expect(xroot.description).to eq 'NewDescription'
      end

      it 'redirect update xroot' do
        patch :update, params: { id: xroot, xroot: attributes_for(:xroot) }

        expect(response).to redirect_to xroot_path(xroot)
      end
    end

    context 'invalid attribute' do
      render_views

      it 'does not change xroot' do
        patch :update, params: { id: xroot, xroot: attributes_for(:xroot, :invalid) }
        xroot.reload

        expect(xroot.title).to have_text 'MyString'
        expect(xroot.description).to have_text 'MyText'
      end

      it 're-render edit view' do
        patch :update, params: { id: xroot, xroot: attributes_for(:xroot, :invalid) }

        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #DESTROY' do
    let!(:xroot) { create(:xroot, user: user) }

    it 'delete xroot' do
      count = Xroot.count
      delete :destroy, params: { id: xroot }

      expect(Xroot.count).to eq count - 1
    end

    it 'redirect index' do
      delete :destroy, params: { id: xroot }

      expect(response).to redirect_to xroots_path
    end
  end
end
