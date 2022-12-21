# frozen_string_literal: true

require 'rails_helper'

RSpec.describe XcategoriesController, type: :controller do
  let(:user) { create(:user) }
  let(:xroot) { create(:xroot, user: user) }
  let(:xcategory) { create(:xcategory, xroot: xroot, user: user) }

  before { login(user) }

  describe 'GET #SHOW' do
    before { get :show, params: { id: xcategory, xroot_id: xroot } }

    it 'request show xcategory to xcategory' do
      expect(assigns(:xcategory)).to eq xcategory
    end

    it 'render show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #NEW' do
    before { get :new, params: { xroot_id: xroot } }

    it 'request new xcategory to xcategory' do
      expect(assigns(:xcategory)).to be_a_new(Xcategory)
    end

    it 'render new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #EDIT' do
    before { get :edit, params: { id: xcategory, xroot_id: xroot } }

    it 'request edit xcategory to xcategory' do
      expect(assigns(:xcategory)).to eq xcategory
    end

    it 'render edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #CREATE' do
    context 'valid attribute' do
      it 'save new xcategory' do
        count = Xcategory.count
        post :create, params: { xcategory: attributes_for(:xcategory), xroot_id: xroot }

        expect(Xcategory.count).to eq count + 1
      end

      it 'redirect to show view' do
        post :create, params: { xcategory: attributes_for(:xcategory), xroot_id: xroot }

        expect(response).to redirect_to xroot_xcategory_path(xroot, Xcategory.last)
      end
    end

    context 'invalid attribute' do
      it 'is not save xcategory' do
        count = Xcategory.count
        post :create, params: { xcategory: attributes_for(:xcategory, :invalid), xroot_id: xroot }

        expect(Xcategory.count).to eq count
      end

      it 'render show new' do
        post :create, params: { xcategory: attributes_for(:xcategory, :invalid), xroot_id: xroot }

        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #UPDATE' do
    context 'valid attribute' do
      it 'update xcategory to xcategory' do
        patch :update, params: { id: xcategory, xcategory: attributes_for(:xcategory), xroot_id: xroot }

        expect(assigns(:xcategory)).to eq xcategory
      end

      it 'change xcategory attribute' do
        patch :update,
              params: { id: xcategory, xcategory: attributes_for(:xcategory, title: 'NewString'), xroot_id: xroot }
        xcategory.reload

        expect(xcategory.title).to eq 'NewString'
      end

      it 'redirect update xcategory' do
        patch :update, params: { id: xcategory, xcategory: attributes_for(:xcategory), xroot_id: xroot }

        expect(response).to redirect_to xroot_xcategory_path(xroot, xcategory)
      end
    end

    context 'invalid attribute' do
      render_views

      it 'does not change xcategory' do
        patch :update, params: { id: xcategory, xcategory: attributes_for(:xcategory, :invalid), xroot_id: xroot }
        xcategory.reload

        expect(xcategory.title).to have_text 'MyString'
        expect(xcategory.description).to have_text 'MyText'
      end

      it 're-render edit view' do
        patch :update, params: { id: xcategory, xcategory: attributes_for(:xcategory, :invalid), xroot_id: xroot }

        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #DESTROY' do
    let!(:xcategory) { create(:xcategory, xroot: xroot, user: user) }

    it 'delete xcategory' do
      count = Xcategory.count
      delete :destroy, params: { id: xcategory, xroot_id: xroot }

      expect(Xcategory.count).to eq count - 1
    end

    it 'redirect index' do
      delete :destroy, params: { id: xcategory, xroot_id: xroot }

      expect(response).to redirect_to xroot_path(xroot)
    end
  end
end
