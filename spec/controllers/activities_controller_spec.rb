require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do
  
  let(:user) { create(:user) }
  let(:activity) { create(:activity, user: user) }

  before { sign_in(user) }

  describe "GET #INDEX" do
    let(:activities) { create_list(:activity, 3, user: user) }

    before { get :index }

    it "array all activities" do
      expect(assigns(:activities)).to match_array(activities)
    end

    it "renders index view" do
      expect(response).to render_template :index
    end
  end

  describe "GET #SHOW" do
    before { get :show, params: { id: activity } }

    it "request show activity to activity" do
      expect(assigns(:activity)).to eq activity
    end

    it "render show view" do
      expect(response).to render_template :show
    end
  end

  describe "GET #NEW" do
    before { get :new }

    it "request new activity to activity" do
      expect(assigns(:activity)).to be_a_new(Activity)
    end

    it "render new view" do
      expect(response).to render_template :new
    end
  end

  describe "GET #EDIT" do
    before { get :edit, params: { id: activity } }

    it "request edit activity to activity" do
      expect(assigns(:activity)).to eq activity
    end

    it "render edit view" do
      expect(response).to render_template :edit
    end
  end

  describe "POST #CREATE" do
    context "valid attribute" do
      it "save new activity" do
        count = Activity.count
        post :create, params: { activity: attributes_for(:activity) }
        expect(Activity.count).to eq count + 1
      end

      it "redirect to show view" do
        post :create, params: { activity: attributes_for(:activity) }
        
        expect(response).to redirect_to activity_path(Activity.last)
      end
    end

    context "invalid attribute" do
      it "is not save activity" do
        count = Activity.count
        post :create, params: { activity: attributes_for(:activity, :invalid) }
        expect(Activity.count).to eq count
      end

      it "render show new" do
        post :create, params: { activity: attributes_for(:activity, :invalid) }
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH(PUT) #UPDATE" do
    context "valid attribute" do
      it "update activity to activity" do
        patch :update, params: { id: activity, activity: attributes_for(:activity) }
        expect(assigns(:activity)).to eq activity
      end

      it "change activity attribute" do
        patch :update, params: { id: activity, activity: attributes_for(:activity, description: "NewDescription") }
        activity.reload

        expect(activity.description).to eq 'NewDescription'
      end

      it "redirect update activity" do
        patch :update, params: { id: activity, activity: attributes_for(:activity) }
        expect(response).to redirect_to activity
      end
    end

    context "invalid attribute" do
      render_views
      
      it "does not change activity" do
        patch :update, params: { id: activity, activity: attributes_for(:activity, :invalid) }
        activity.reload

        expect(activity.title).to eq 'MyString'
        expect(activity.description).to eq 'MyText'
      end

      it "re-render edit view" do
        patch :update, params: { id: activity, activity: attributes_for(:activity, :invalid) }
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #DESTROY" do
    let!(:activity) { create(:activity, user: user) }

    it "delete activity" do
      count = Activity.count
      delete :destroy, params: { id: activity }
      expect(Activity.count).to eq count - 1
    end

    it "redirect index" do
      delete :destroy, params: { id: activity }
      expect(response).to redirect_to activities_path
    end
  end
end