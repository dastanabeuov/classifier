require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do

  let(:valid_session) { create :user }
  let(:valid_attributes) { create :activity }
  let(:invalid_attributes) { create :activity, name: nil }

  describe "GET #INDEX" do
    it "returns a success response" do
      Activity.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #SHOW" do
    it "returns a success response" do
      activity = Activity.create! valid_attributes
      get :show, params: {id: activity.to_param}, session: valid_session
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
      activity = Activity.create! valid_attributes
      get :edit, params: {id: activity.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #CREATE" do
    context "with valid params" do
      it "creates a new Activity" do
        expect {
          post :create, params: {activity: valid_attributes}, session: valid_session
        }.to change(Activity, :count).by(1)
      end

      it "redirects to the created activity" do
        post :create, params: {activity: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Activity.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {activity: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #UPDATE" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested activity" do
        activity = Activity.create! valid_attributes
        put :update, params: {id: activity.to_param, activity: new_attributes}, session: valid_session
        activity.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the activity" do
        activity = Activity.create! valid_attributes
        put :update, params: {id: activity.to_param, activity: valid_attributes}, session: valid_session
        expect(response).to redirect_to(activity)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        activity = Activity.create! valid_attributes
        put :update, params: {id: activity.to_param, activity: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #DESTROY" do
    it "destroys the requested activity" do
      activity = Activity.create! valid_attributes
      expect {
        delete :destroy, params: {id: activity.to_param}, session: valid_session
      }.to change(Activity, :count).by(-1)
    end

    it "redirects to the activities list" do
      activity = Activity.create! valid_attributes
      delete :destroy, params: {id: activity.to_param}, session: valid_session
      expect(response).to redirect_to(activities_url)
    end
  end

end