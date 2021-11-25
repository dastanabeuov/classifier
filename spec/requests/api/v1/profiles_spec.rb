# frozen_string_literal: true

require 'rails_helper'

describe 'Profiles API', type: :request do
  let(:headers) do
    { 'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json' }
  end

  let(:me) { create(:user) }
  let(:access_token) { create(:access_token, resource_owner_id: me.id) }

  describe 'GET /me' do
    let(:api_path) { '/api/v1/profiles/me' }

    it_behaves_like 'Unauthorized' do
      let(:method) { :get }
    end

    context 'authorized' do
      before { get api_path, params: { access_token: access_token.token }, headers: headers }

      it 'returns 200 status' do
        expect(response).to be_successful
      end

      it 'returns all public fields' do
        %w[id email created_at updated_at].each do |attr|
          expect(json[attr]).to eq me.send(attr).as_json
        end
      end

      it 'does not return private fields' do
        %w[password encrypted_password].each do |attr|
          expect(json).to_not have_key(attr)
        end
      end
    end
  end

  describe 'GET /index' do
    let!(:users) { create_list(:user, 3) }

    let(:api_path) { '/api/v1/profiles' }

    it_behaves_like 'Unauthorized' do
      let(:method) { :get }
    end

    context 'authorized' do
      before { get api_path, params: { access_token: access_token.token, format: :json }, headers: headers }

      it 'returns 200 status' do
        expect(response).to be_successful
      end

      it 'returns list of xroots' do
        expect(json['users'].size).to eq 3
      end

      it 'contains list of users except me' do
        expect(response.body).not_to be_json_eql(users.to_json)
      end

      it 'does not contain profile of me' do
        expect(response.body).not_to include_json(me.to_json)
      end
    end
  end
end
