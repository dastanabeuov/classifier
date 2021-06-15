require 'rails_helper'

describe 'Activities API', type: :request do
  let(:headers) do
    { 'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json' }
  end
  let(:user) { create(:user) }
  let(:access_token) { create(:access_token, resource_owner_id: user.id) }

  describe 'GET /api/v1/activities' do
    let(:api_path) { '/api/v1/activities' }

    it_behaves_like 'API Authorizable' do
      let(:method) { :get }
    end

    context 'authorized' do
      let!(:activities) { create_list(:activity, 2, user: user) }
      let(:activity) { activities.first }
      let(:activity_response) { json['activities'].first }

      before { get api_path, params: { access_token: access_token.token }, headers: headers }

      it 'returns 200 status' do
        expect(response).to be_successful
      end

      it 'returns list of activities' do
        expect(json['activities'].size).to eq 2
      end

      it 'returns all public fields' do
        %w[id title describtion synonym code version_date publish position ancestry user_id created_at
           updated_at].each do |attr|
          expect(activity_response[attr]).to eq activity.send(attr).as_json
        end
      end

      it 'contains user object' do
        expect(activity_response['user']['id']).to eq activity.user.id
      end
    end
  end

  describe 'GET /show' do
    let!(:activities) { create_list(:activity, 2, user: user) }
    let(:activity) { activities.first }

    let(:api_path) { '/api/v1/activities/#{activity.id}' }

    it_behaves_like 'API Authorizable' do
      let(:method) { :get }
    end

    context 'Authorized' do
      before { get api_path, params: { format: :json, access_token: access_token.token } }

      it '- returns 200 status' do
        expect(response).to have_http_status(200)
      end

      context '- contains' do
        %w[id title describtion synonym code version_date publish position ancestry user_id created_at
           updated_at].each do |attr|
          it "- #{attr}" do
            expect(response.body).to be_json_eql(activity.send(attr.to_sym).to_json).at_path(attr.to_s)
          end
        end
      end
    end

    def send_request(params = {})
      get api_path, params: { format: :json }.merge(params)
    end
  end

  describe 'POST /create' do
    let(:attrs) { attributes_for(:activity, user: user) }
    let(:invalid_attrs) { attributes_for(:activity, title: :invalid, user: user) }

    let(:api_path) { '/api/v1/activities' }

    it_behaves_like 'API Authorizable' do
      let(:method) { :post }
    end

    context 'Authorized' do
      context '- invalid attributes' do
        it '- returns 422 status' do
          post api_path, params: { access_token: access_token.token, activity: invalid_attrs, format: :json }
          expect(response).to have_http_status(422)
        end
      end

      context '- valid attributes' do
        before { post api_path, params: { access_token: access_token.token, activity: attrs, format: :json } }

        it '- returns status 201-Created' do
          expect(response).to have_http_status(201)
        end

        %w[id title describtion synonym code version_date publish position ancestry user_id created_at
           updated_at].each do |attr|
          it "- contains #{attr}" do
            expect(response.body).to have_json_path(attr)
          end
        end

        %w[title describtion].each do |attr|
          it "- set #{attr}" do
            expect(response.body).to be_json_eql(attrs[attr.to_sym].to_json).at_path(attr)
          end
        end

        it '- set user_id' do
          expect(response.body).to be_json_eql(user.id.to_json).at_path('user_id')
        end
      end
    end

    def send_request(params = {})
      post api_path, params: { format: :json }.merge(params)
    end
  end
end
