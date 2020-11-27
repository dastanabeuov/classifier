require 'rails_helper'

RSpec.describe XrootsController, type: :controller do

  let(:valid_session) { create :user }
  let(:valid_attributes) { create :xroot }
  let(:invalid_attributes) { create :xroot, name: nil }

  describe "GET #INDEX" do
    it "returns a success response" do
      Xroot.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #SHOW" do
    it "returns a success response" do
      xroot = Xroot.create! valid_attributes
      get :show, params: {id: xroot.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #NEW" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #EDIT" do
    it "returns a success response" do
      xroot = Xroot.create! valid_attributes
      get :edit, params: {id: xroot.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #CREATE" do
    context "with valid params" do
      it "creates a new xroot" do
        expect {
          post :create, params: {xroot: valid_attributes}, session: valid_session
        }.to change(xroot, :count).by(1)
      end

      it "redirects to the created xroot" do
        post :create, params: {xroot: valid_attributes}, session: valid_session
        expect(response).to redirect_to(xroot.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {xroot: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #UPDATE" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested xroot" do
        xroot = Xroot.create! valid_attributes
        put :update, params: {id: xroot.to_param, xroot: new_attributes}, session: valid_session
        xroot.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the xroot" do
        xroot = Xroot.create! valid_attributes
        put :update, params: {id: xroot.to_param, xroot: valid_attributes}, session: valid_session
        expect(response).to redirect_to(xroot)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        xroot = Xroot.create! valid_attributes
        put :update, params: {id: xroot.to_param, xroot: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #DESTROY" do
    it "destroys the requested xroot" do
      xroot = Xroot.create! valid_attributes
      expect {
        delete :destroy, params: {id: xroot.to_param}, session: valid_session
      }.to change(xroot, :count).by(-1)
    end

    it "redirects to the Xroots list" do
      xroot = Xroot.create! valid_attributes
      delete :destroy, params: {id: xroot.to_param}, session: valid_session
      expect(response).to redirect_to(Xroots_url)
    end
  end

end
