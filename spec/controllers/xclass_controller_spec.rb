# frozen_string_literal: true

require 'rails_helper'

RSpec.describe XclassesController, type: :controller do
  let(:user) { create(:user) }
  before { login(user) }
  let(:xroot) { create(:xroot, user: user) }
  let(:xcategory) { create(:xcategory, xroot: xroot, user: user) }
  let(:xclass) { create(:xclass, xcategory: xcategory, user: user) }

  describe 'GET #SHOW' do
    before { get :show, params: { xroot_id: xroot, xcategory_id: xcategory, id: xclass } }

    it 'request show xclass' do
      expect(assigns(:xclass)).to eq xclass
    end

    it 'render show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #NEW' do
    before { get :new, params: { xroot_id: xroot, xcategory_id: xcategory } }

    it 'request new xclass' do
      expect(assigns(:xclass)).to be_a_new(Xclass)
    end

    it 'render new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #EDIT' do
    before { get :edit, params: { xroot_id: xroot, xcategory_id: xcategory, id: xclass } }

    it 'request edit xclass' do
      expect(assigns(:xclass)).to eq xclass
    end

    it 'render edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #CREATE' do
    context 'valid attribute' do
      it 'save new xclass' do
        count = Xclass.count
        post :create, params: { xroot_id: xroot, xcategory_id: xcategory, xclass: attributes_for(:xclass) }

        expect(Xclass.count).to eq count + 1
      end

      it 'redirect to show view' do
        post :create, params: { xroot_id: xroot, xcategory_id: xcategory, xclass: attributes_for(:xclass) }

        expect(response).to redirect_to xroot_xcategory_xclass_path(xroot, xcategory, Xclass.last)
      end
    end

    context 'invalid attribute' do
      it 'is not save xclass' do
        count = Xclass.count
        post :create, params: { xroot_id: xroot, xcategory_id: xcategory, xclass: attributes_for(:xclass, :invalid) }

        expect(Xclass.count).to eq count
      end

      it 'render new' do
        post :create, params: { xroot_id: xroot, xcategory_id: xcategory, xclass: attributes_for(:xclass, :invalid) }

        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #UPDATE' do
    context 'valid attribute' do
      it 'update attribute xclass' do
        put :update,
            params: { xroot_id: xroot, xcategory_id: xcategory, id: xclass,
                      xclass: attributes_for(:xclass, title: 'NewString') }

        expect(assigns(:xclass)).to eq xclass
      end

      it 'redirect update xclass' do
        put :update, params: { xroot_id: xroot, xcategory_id: xcategory, id: xclass, xclass: attributes_for(:xclass) }

        expect(response).to redirect_to xroot_xcategory_xclass_path(xroot, xcategory, xclass)
      end
    end

    context 'with invalid attributes' do
      before do
        put :update,
            params: { xroot_id: xroot, xcategory_id: xcategory, id: xclass, xclass: attributes_for(:xclass, :invalid) }
      end

      it 'does not change question' do
        xclass.reload

        expect(xclass.title).to have_text 'MyString'
        expect(xclass.description).to have_text 'MyText'
      end

      it 'renders edit' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #DESTROY' do
    let!(:xclass) { create(:xclass, xcategory: xcategory, user: user) }

    it 'delete xclass' do
      count = Xclass.count
      delete :destroy, params: { xroot_id: xroot, xcategory_id: xcategory, id: xclass }

      expect(Xclass.count).to eq count - 1
    end

    it 'redirect xclass xcategory or xclass parent' do
      delete :destroy, params: { xroot_id: xroot, xcategory_id: xcategory, id: xclass }

      if xclass.parent
        expect(response).to redirect_to xroot_xcategory_xclass_path(xroot, xcategory, xclass.parent)
      else
        expect(response).to redirect_to xroot_xcategory_path(xroot, xcategory)
      end
    end
  end
end
