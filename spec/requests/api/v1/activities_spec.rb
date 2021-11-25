# frozen_string_literal: true

require 'rails_helper'

describe 'Activities API', type: :request do
  let(:headers) do
    { 'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json' }
  end

  let(:user) { create(:user) }
  let(:access_token) { create(:access_token, resource_owner_id: user.id) }
  let!(:activities) { create_list(:activity, 3, user: user) }
  let(:activity) { activities.first }
  let(:activity_response) { json['activity'] }

  describe 'GET /index' do
    let(:api_path) { '/api/v1/activities' }

    it_behaves_like 'Unauthorized' do
      let(:method) { :get }
    end

    context 'authorized' do
      before { get api_path, params: { access_token: access_token.token }, headers: headers }

      it 'returns 200 status' do
        expect(response).to be_successful
      end

      it 'returns list of activity' do
        expect(json['activities'].size).to eq 3
      end
    end
  end

  describe 'GET /show' do
    let(:api_path) { "/api/v1/activities/#{activity.id}" }

    it_behaves_like 'Unauthorized' do
      let(:method) { :get }
    end

    context 'Authorized' do
      before { get api_path, params: { access_token: access_token.token, format: :json } }

      it '- returns 200 status' do
        expect(response).to be_successful
      end

      it 'returns all public fields' do
        %w[id title description synonym code version_date publish position ancestry user_id created_at
           updated_at].each do |attr|
          expect(activity_response[attr]).to eq activity.send(attr).as_json
        end
      end

      # it 'non returns private fields' do
      #   %w[example_filed_1 example_field_2].each do |attr|
      #     expect(json).to_not have_key(attr)
      #   end
      # end
    end

    def send_request(params = {})
      get api_path, params: { format: :json }.merge(params)
    end
  end

  describe 'POST /create' do
    let(:valid_attrs) { attributes_for(:activity, user: user) }
    let(:invalid_attrs) { attributes_for(:activity, :invalid, user: user) }

    let(:api_path) { '/api/v1/activities' }

    it_behaves_like 'Unauthorized' do
      let(:method) { :post }
    end

    context 'Authorized' do
      context '- invalid attributes' do
        it '- returns 422 status' do
          post api_path, params: { activity: invalid_attrs, access_token: access_token.token, format: :json }
          expect(response).to have_http_status(422)
        end
      end

      context '- valid attributes' do
        it '- returns 200 status' do
          post api_path, params: { activity: valid_attrs, access_token: access_token.token, format: :json }
          expect(response).to be_successful
        end
      end
    end

    def send_request(params = {})
      post api_path, params: { format: :json }.merge(params)
    end
  end

  describe 'PUT /update' do
    let(:valid_attrs) { attributes_for(:activity, user: user) }

    let(:api_path) { "/api/v1/activities/#{activity.id}" }

    it_behaves_like 'Unauthorized' do
      let(:method) { :put }
    end

    context 'Authorized' do
      it '- returns 200 status' do
        put api_path, params: { activity: valid_attrs, access_token: access_token.token, format: :json }
        expect(response).to have_http_status(204)
      end
    end

    def send_request(params = {})
      put api_path, params: { format: :json }.merge(params)
    end
  end

  describe 'DELETE /delete' do
    let(:api_path) { "/api/v1/activities/#{activity.id}" }

    it_behaves_like 'Unauthorized' do
      let(:method) { :delete }
    end

    context 'Authorized' do
      it '- returns 204 status' do
        delete api_path, params: { access_token: access_token.token, format: :json }
        expect(response).to be_successful
      end
    end

    def send_request(params = {})
      delete api_path, params: { format: :json }.merge(params)
    end
  end
end
