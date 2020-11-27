require 'rails_helper'

RSpec.describe PropertiesController, type: :controller do

  let(:valid_session) { create :user }
  let(:valid_attributes) { create :property }
  let(:invalid_attributes) { create :property, name: nil }


  describe "GET #INDEX" do
    it "returns a success response" do
      Property.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #SHOW" do
    it "returns a success response" do
      property = Property.create! valid_attributes
      get :show, params: {id: property.to_param}, session: valid_session
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
      property = Property.create! valid_attributes
      get :edit, params: {id: property.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #CREATE" do
    context "with valid params" do
      it "creates a new Property" do
        expect {
          post :create, params: {property: valid_attributes}, session: valid_session
        }.to change(Property, :count).by(1)
      end

      it "redirects to the created property" do
        post :create, params: {property: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Property.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {property: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #UPDATE" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested property" do
        property = Property.create! valid_attributes
        put :update, params: {id: property.to_param, property: new_attributes}, session: valid_session
        property.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the property" do
        property = Property.create! valid_attributes
        put :update, params: {id: property.to_param, property: valid_attributes}, session: valid_session
        expect(response).to redirect_to(property)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        property = Property.create! valid_attributes
        put :update, params: {id: property.to_param, property: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #DESTROY" do
    it "destroys the requested property" do
      property = Property.create! valid_attributes
      expect {
        delete :destroy, params: {id: property.to_param}, session: valid_session
      }.to change(Property, :count).by(-1)
    end

    it "redirects to the properties list" do
      property = Property.create! valid_attributes
      delete :destroy, params: {id: property.to_param}, session: valid_session
      expect(response).to redirect_to(properties_url)
    end
  end

end
