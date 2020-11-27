require 'rails_helper'

RSpec.describe XclassesController, type: :controller do

  let(:valid_session) { create :user }
  let(:valid_attributes) { create :Xclass }
  let(:invalid_attributes) { create :Xclass, name: nil }

  describe "GET #INDEX" do
    it "returns a success response" do
      Xclass.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #SHOW" do
    it "returns a success response" do
      Xclass = Xclass.create! valid_attributes
      get :show, params: {id: Xclass.to_param}, session: valid_session
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
      Xclass = Xclass.create! valid_attributes
      get :edit, params: {id: Xclass.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #CREATE" do
    context "with valid params" do
      it "creates a new Xclass" do
        expect {
          post :create, params: {Xclass: valid_attributes}, session: valid_session
        }.to change(Xclass, :count).by(1)
      end

      it "redirects to the created Xclass" do
        post :create, params: {Xclass: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Xclass.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {Xclass: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #UPDATE" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested Xclass" do
        Xclass = Xclass.create! valid_attributes
        put :update, params: {id: Xclass.to_param, Xclass: new_attributes}, session: valid_session
        Xclass.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the Xclass" do
        Xclass = Xclass.create! valid_attributes
        put :update, params: {id: Xclass.to_param, Xclass: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Xclass)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        Xclass = Xclass.create! valid_attributes
        put :update, params: {id: Xclass.to_param, Xclass: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #DESTROY" do
    it "destroys the requested Xclass" do
      Xclass = Xclass.create! valid_attributes
      expect {
        delete :destroy, params: {id: Xclass.to_param}, session: valid_session
      }.to change(Xclass, :count).by(-1)
    end

    it "redirects to the Xclasses list" do
      Xclass = Xclass.create! valid_attributes
      delete :destroy, params: {id: Xclass.to_param}, session: valid_session
      expect(response).to redirect_to(Xclasses_url)
    end
  end

end
