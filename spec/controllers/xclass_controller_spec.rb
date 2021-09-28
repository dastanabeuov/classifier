require 'rails_helper'

RSpec.describe XclassesController, type: :controller do
  let(:user) { create(:user) }
  let(:xroot) { create(:xroot, user: user) }
  let(:xcategory) { create(:xcategory, xroot: xroot, user: user) }
  let(:xclass) { create(:xclass, xcategory: xcategory, user: user) }

  before { login(user) }

  describe 'GET #SHOW' do
    before { get :show , params: { xroot_id: xroot, xcategory_id: xcategory, id: xclass } }

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
      expect(assigns(:xclass)).to be_a_new(xclass)
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
        post :create, params: { xroot_id: xroot, xcategory_id: xcategory, xclass: attributes_for(:xclass, full_code: '001') }

        expect(response).to redirect_to xroot_xcategory_xclass_path(xroot, xcategory, Xclass.last)
      end
    end

    context 'invalid attribute' do
      it 'is not save xclass' do
        count = Xclass.count
        post :create, params: { xroot_id: xroot, xcategory_id: xcategory, xclass: attributes_for(:xclass, title: '') }

        expect(Xclass.count).to eq count
      end

      it 'render show new' do
        post :create, params: { xroot_id: xroot, xcategory_id: xcategory, xclass: attributes_for(:xclass, title: '') }

        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #UPDATE' do
    context 'valid attribute' do
      it 'update xclass' do
        put :update, params: { xroot_id: xroot, xcategory_id: xcategory, xclass: attributes_for(:xclass) }

        expect(assigns(:xclass)).to eq xclass
      end

      it 'change xclass attribute' do
        put :update, params: { xroot_id: xroot, xcategory_id: xcategory, xclass: attributes_for(:xclass, description: 'NewText') }
        xclass.reload

        expect(xclass.description).to eq 'NewText'
      end

      it 'redirect update xclass' do
        put :update, params: { xroot_id: xroot, xcategory_id: xcategory, xclass: attributes_for(:xclass) }

        expect(response).to redirect_to xroot_xcategory_xclass_path(xroot, xcategory, xclass)
      end
    end

    context 'invalid attribute' do
      render_views

      it 'does not change xclass' do
        put :update, params: { xroot_id: xroot, xcategory_id: xcategory, xclass: attributes_for(:xclass, title: '') }
        xclass.reload

        expect(xclass.title).to eq 'MyString'
        expect(xclass.description).to eq 'MyText'
      end

      it 're-render edit view' do
        put :update, params: { xroot_id: xroot, xcategory_id: xcategory, xclass: attributes_for(:xclass, title: '') }

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
