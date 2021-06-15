require 'rails_helper'

RSpec.describe PropertiesController, type: :controller do
  let(:user) { create :user }
  let(:xroot) { create :xroot, user: user }
  let(:activity) { create :activity, user: user }
  let(:property) { create :property, activity: activity, propertyable: xroot }

  describe 'POST #CREATE' do
    context 'valid attribute' do
      it 'save new property' do
        count = Property.count
        post :create, params: { property: attributes_for(:property) }
        expect(Property.count).to eq count + 1
      end

      it 'redirect to show view' do
        post :create, params: { property: attributes_for(:property) }

        expect(response).to redirect_to property_path(Property.last)
      end
    end

    context 'invalid attribute' do
      it 'is not save activity' do
        count = Property.count
        post :create, params: { property: attributes_for(:property, :invalid) }
        expect(Property.count).to eq count
      end

      it 'render show new' do
        post :create, params: { propety: attributes_for(:property, :invalid) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH(PUT) #UPDATE' do
    context 'valid attribute' do
      it 'update property to property' do
        patch :update, params: { id: property, property: attributes_for(:property) }
        expect(assigns(:property)).to eq property
      end

      it 'change property attribute' do
        patch :update, params: { id: property, property: attributes_for(:property, name: 'Newname') }
        property.reload

        expect(property.name).to eq 'Newname'
      end

      it 'redirect update property' do
        patch :update, params: { id: property, property: attributes_for(:property) }
        expect(response).to redirect_to property
      end
    end

    context 'invalid attribute' do
      render_views

      it 'does not change property' do
        patch :update, params: { id: property, property: attributes_for(:property, :invalid) }
        property.reload

        expect(property.title).to eq 'MyString'
        expect(property.name).to eq 'MyText'
      end

      it 're-render edit view' do
        patch :update, params: { id: property, property: attributes_for(:property, :invalid) }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #DESTROY' do
    let!(:property) { create(:property, user: user) }

    it 'delete property' do
      count = Property.count
      delete :destroy, params: { id: property }
      expect(Property.count).to eq count - 1
    end

    it 'redirect index' do
      delete :destroy, params: { id: property }
      expect(response).to redirect_to properties_path
    end
  end
end
