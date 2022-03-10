# frozen_string_literal: true

require 'rails_helper'

describe 'Xroots API', type: :request do
  let(:headers) do
    { 'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json' }
  end

  let(:user) { create(:user) }
  let(:access_token) { create(:access_token, resource_owner_id: user.id) }

  let(:xroot) { create(:xroot, user: user) }
  let(:xcategory) { create(:xcategory, xroot: xroot, user: user) }
  let(:xcategory_response) { json['xcategory'] }

  describe 'GET /show' do
    let(:api_path) { "/api/v1/xroots/#{xroot.id}/xcategories/#{xcategory.id}" }

    it_behaves_like 'Unauthorized' do
      let(:method) { :get }
    end

    context 'Authorized' do
      before { get api_path, params: { access_token: access_token.token, format: :json } }

      it '- returns 200 status' do
        expect(response).to be_successful
      end

      it 'returns all public fields' do
        %w[id title description synonym code version_date publish user_id created_at updated_at].each do |attr|
          expect(xcategory_response[attr]).to eq xcategory.send(attr).as_json
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
    let(:valid_attrs) { attributes_for(:xcategory, user: user) }
    let(:invalid_attrs) { attributes_for(:xcategory, :invalid, user: user) }

    let(:api_path) { "/api/v1/xroots/#{xroot.id}/xcategories" }

    it_behaves_like 'Unauthorized' do
      let(:method) { :post }
    end

    context 'Authorized' do
      context '- invalid attributes' do
        it '- returns 422 status' do
          post api_path, params: { xcategory: invalid_attrs, access_token: access_token.token, format: :json }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context '- valid attributes' do
        it '- returns 200 status' do
          post api_path, params: { xcategory: valid_attrs, access_token: access_token.token, format: :json }
          expect(response).to be_successful
        end
      end
    end

    def send_request(params = {})
      post api_path, params: { format: :json }.merge(params)
    end
  end

  describe 'PUT /update' do
    let(:valid_attrs) { attributes_for(:xcategory, user: user) }

    let(:api_path) { "/api/v1/xroots/#{xroot.id}/xcategories/#{xcategory.id}" }

    it_behaves_like 'Unauthorized' do
      let(:method) { :put }
    end

    context 'Authorized' do
      it '- returns 200 status' do
        put api_path, params: { xcategory: valid_attrs, access_token: access_token.token, format: :json }
        expect(response).to have_http_status(:no_content)
      end
    end

    def send_request(params = {})
      put api_path, params: { format: :json }.merge(params)
    end
  end

  describe 'DELETE /delete' do
    let(:api_path) { "/api/v1/xroots/#{xroot.id}/xcategories/#{xcategory.id}" }

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
