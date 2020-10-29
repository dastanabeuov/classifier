require 'rails_helper'

RSpec.describe XcategoriesController, type: :controller do

  let(:valid_attributes) { create :xcategory }

  let(:invalid_attributes) { create :xcategory, name: nil }

  let(:valid_session) { create :user }

  describe "GET #index" do
    it "returns a success response" do
      Xcategory.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      xcategory = Xcategory.create! valid_attributes
      get :show, params: {id: xcategory.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      xcategory = Xcategory.create! valid_attributes
      get :edit, params: {id: xcategory.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new xcategory" do
        expect {
          post :create, params: {xcategory: valid_attributes}, session: valid_session
        }.to change(xcategory, :count).by(1)
      end

      it "redirects to the created xcategory" do
        post :create, params: {xcategory: valid_attributes}, session: valid_session
        expect(response).to redirect_to(xcategory.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {xcategory: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested xcategory" do
        xcategory = Xcategory.create! valid_attributes
        put :update, params: {id: xcategory.to_param, xcategory: new_attributes}, session: valid_session
        xcategory.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the xcategory" do
        xcategory = Xcategory.create! valid_attributes
        put :update, params: {id: xcategory.to_param, xcategory: valid_attributes}, session: valid_session
        expect(response).to redirect_to(xcategory)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        xcategory = Xcategory.create! valid_attributes
        put :update, params: {id: xcategory.to_param, xcategory: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested xcategory" do
      xcategory = Xcategory.create! valid_attributes
      expect {
        delete :destroy, params: {id: xcategory.to_param}, session: valid_session
      }.to change(xcategory, :count).by(-1)
    end

    it "redirects to the xcategories list" do
      xcategory = Xcategory.create! valid_attributes
      delete :destroy, params: {id: xcategory.to_param}, session: valid_session
      expect(response).to redirect_to(xcategories_url)
    end
  end

end
