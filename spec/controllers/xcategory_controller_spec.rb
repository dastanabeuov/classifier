require 'rails_helper'

RSpec.describe XcategoriesController, type: :controller do

  let(:user) { create(:user) }
  let(:xroot) { create(:xroot, user: user) }
  let(:xcategory) { create(:xcategory, xroot: xroot, user: user) }

  describe "GET #INDEX" do
    let(:xcategories) { create_list(:xcategory, 3, xroot: xroot, user: user) }

    before { get :index }

    it "array all xcategories" do
      expect(assigns(:xcategories)).to match_array(xcategories)
    end

    it "renders index view" do
      expect(response).to render_template :index
    end
  end

  describe "GET #SHOW" do
    before { get :show, params: { id: xcategory } }

    it "request show xcategory to xcategory" do
      expect(assigns(:xcategory)).to eq xcategory
    end

    it "render show view" do
      expect(response).to render_template :show
    end
  end

  describe "GET #NEW" do
    before { get :new }

    it "request new xcategory to xcategory" do
      expect(assigns(:xcategory)).to be_a_new(Xcategory)
    end

    it "render new view" do
      expect(response).to render_template :new
    end
  end

  describe "GET #EDIT" do
    before { get :edit, params: { id: xcategory } }

    it "request edit xcategory to xcategory" do
      expect(assigns(:xcategory)).to eq xcategory
    end

    it "render edit view" do
      expect(response).to render_template :edit
    end
  end

  describe "POST #CREATE" do
    context "valid attribute" do
      it "save new xcategory" do
        count = Xcategory.count
        post :create, params: { xcategory: attributes_for(:xcategory) }
        expect(Xcategory.count).to eq count + 1
      end

      it "redirect to show view" do
        post :create, params: { xcategory: attributes_for(:xcategory) }
        
        expect(response).to redirect_to xroot_xcategory_path(Xcategory.last.xroot, Xcategory.last)
      end
    end

    context "invalid attribute" do
      it "is not save xcategory" do
        count = Xcategory.count
        post :create, params: { xcategory: attributes_for(:xcategory, :invalid) }
        expect(Xcategory.count).to eq count
      end

      it "render show new" do
        post :create, params: { xcategory: attributes_for(:xcategory, :invalid) }
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT #UPDATE" do
    context "valid attribute" do
      it "update xcategory to xcategory" do
        patch :update, params: { id: xcategory, xcategory: attributes_for(:xcategory) }
        expect(assigns(:xcategory)).to eq xcategory
      end

      it "change xcategory attribute" do
        patch :update, params: { id: xcategory, xcategory: attributes_for(:xcategory, description: "NewDescription") }
        xcategory.reload

        expect(xcategory.description).to eq 'NewDescription'
      end

      it "redirect update xcategory" do
        patch :update, params: { id: xcategory, xcategory: attributes_for(:xcategory) }
        expect(response).to redirect_to xroot_xcategory_path(xroot, xcategory)
      end
    end

    context "invalid attribute" do
      render_views
      
      it "does not change xcategory" do
        patch :update, params: { id: xcategory, xcategory: attributes_for(:xcategory, :invalid) }
        xcategory.reload

        expect(xcategory.name).to eq 'MyString'
        expect(xcategory.description).to eq 'MyText'
      end

      it "re-render edit view" do
        patch :update, params: { id: xcategory, xcategory: attributes_for(:xcategory, :invalid) }
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #DESTROY" do
    let!(:xcategory) { create(:xcategory, xroot: xroot, user: user) }

    it "delete xcategory" do
      count = Xcategory.count
      delete :destroy, params: { id: xcategory }
      expect(Xcategory.count).to eq count - 1
    end

    it "redirect index" do
      delete :destroy, params: { id: xcategory }
      expect(response).to redirect_to xcategories_path(xcategory.xroot)
    end
  end
end
