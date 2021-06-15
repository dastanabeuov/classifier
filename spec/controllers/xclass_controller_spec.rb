require 'rails_helper'

RSpec.describe XclassesController, type: :controller do
  let(:user) { create(:user) }
  let(:xroot) { create(:xroot, user: user) }
  let(:xcategory) { create(:xcategory, xroot: xroot, user: user) }
  let(:xclass) { create(:xclass, xcategory: xcategory, user: user) }

  describe 'GET #SHOW' do
    before { get :show, params: { id: xclass } }

    it 'request show xcategory to xcategory' do
      expect(assigns(:xclass)).to eq xclass
    end

    it 'render show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #NEW' do
    before { get :new }

    it 'request new xclass to xclass' do
      expect(assigns(:xclass)).to be_a_new(xclass)
    end

    it 'render new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #EDIT' do
    before { get :edit, params: { id: xclass } }

    it 'request edit xclass to xclass' do
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
        post :create, params: { xclass: attributes_for(:xclass) }
        expect(Xclass.count).to eq count + 1
      end

      it 'redirect to show view' do
        post :create, params: { xclass: attributes_for(:xclass) }

        expect(response).to redirect_to xclass_path(Xclass.last)
      end
    end

    context 'invalid attribute' do
      it 'is not save xclass' do
        count = Xclass.count
        post :create, params: { xclass: attributes_for(:xclass, :invalid) }
        expect(Xclass.count).to eq count
      end

      it 'render show new' do
        post :create, params: { xclass: attributes_for(:xclass, :invalid) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #UPDATE' do
    context 'valid attribute' do
      it 'update xclass to xclass' do
        patch :update, params: { id: xclass, xclass: attributes_for(:xclass) }
        expect(assigns(:xclass)).to eq xclass
      end

      it 'change xclass attribute' do
        patch :update, params: { id: xclass, xclass: attributes_for(:xclass, description: 'NewDescription') }
        xclass.reload

        expect(xclass.description).to eq 'NewDescription'
      end

      it 'redirect update xclass' do
        patch :update, params: { id: xclass, xclass: attributes_for(:xclass) }
        expect(response).to redirect_to xroot_xcategory_xclass_path(xroot, xcategory, xclass)
      end
    end

    context 'invalid attribute' do
      render_views

      it 'does not change xclass' do
        patch :update, params: { id: xclass, xclass: attributes_for(:xclass, :invalid) }
        xclass.reload

        expect(xclass.title).to eq 'MyString'
        expect(xclass.description).to eq 'MyText'
      end

      it 're-render edit view' do
        patch :update, params: { id: xclass, xclass: attributes_for(:xclass, :invalid) }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #DESTROY' do
    let!(:xclass) { create(:xclass, xcategory: xcategory, user: user) }

    it 'delete xclass' do
      count = Xclass.count
      delete :destroy, params: { id: xclass }
      expect(Xclass.count).to eq count - 1
    end

    it 'redirect index' do
      delete :destroy, params: { id: xclass }
      expect(response).to redirect_to xroot_xcategpry_xclasses_path(xclass.xcategory.xroot, xclass.xcategory)
    end
  end
end
