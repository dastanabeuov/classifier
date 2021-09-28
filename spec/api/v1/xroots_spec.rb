require 'rails_helper'

describe 'Xroots API', type: :request do
  let(:headers) do
    { 'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json' }
  end

  let(:user) { create(:user) }
  let(:access_token) { create(:access_token, resource_owner_id: user.id) }

  describe 'GET /index' do
    let(:api_path) { '/api/v1/xroots' }

    it_behaves_like 'API Authorizable' do
      let(:method) { :get }
    end

    context 'authorized' do
      let(:xroots) { create_list(:xroot, 3, user: user) }
      let(:xroot) { xroots.first }
      let(:xroot_response) { json['xroots'].first }

      before { get api_path, params: { access_token: access_token.token }, headers: headers }

      it 'returns 200 status' do
        expect(response).to be_successful
      end

      it 'returns list of xroots' do
        expect(json['xroots'].size).to eq 3
      end

      it 'returns all public fields' do
        %w[id title description synonym code version_date publish].each do |attr|
          expect(xroot_response[attr]).to eq xroot.send(attr).as_json
        end
      end
    end
  end

  describe 'GET /show' do
    let(:xroot) { create(:xroot, user: user) }
    let(:api_path) { '/api/v1/xroots/#{xroot.id}' }

    it_behaves_like 'API Authorizable' do
      let(:method) { :get }
    end

    context 'Authorized' do
      before { get api_path, params: { format: :json, access_token: access_token.token, xroot: xroot } }

      it '- returns 200 status' do
        expect(response).to have_http_status(200)
      end

      context '- contains' do
        %w[id title describtion synonym code version_date publish].each do |attr|
          it "- #{attr}" do
            expect(response.body).to be_json_eql(xroot.send(attr.to_sym).to_json).at_path(attr.to_s)
          end
        end
      end
    end

    def send_request(params = {})
      get api_path, params: { format: :json }.merge(params)
    end
  end

  describe 'POST /create' do
    let(:valid_attrs) { attributes_for(:xroot, user: user) }
    let(:invalid_attrs) { attributes_for(:xroot, title: '', user: user) }

    let(:api_path) { '/api/v1/xroots' }

    it_behaves_like 'API Authorizable' do
      let(:method) { :post }
    end

    context 'Authorized' do
      context '- invalid attributes' do
        it '- returns 422 status' do
          post api_path, params: { access_token: access_token.token, xroot: invalid_attrs, format: :json }
          expect(response).to have_http_status(422)
        end
      end

      context '- valid attributes' do
        before { post api_path, params: { access_token: access_token.token, xroot: valid_attrs, format: :json } }

        it '- returns status 201-Created' do
          expect(response).to have_http_status(201)
        end

        %w[id title describtion synonym code version_date publish user_id created_at updated_at].each do |attr|
          it "- contains #{attr}" do
            expect(response.body).to have_json_path(attr)
          end
        end
      end
    end

    def send_request(params = {})
      post api_path, params: { format: :json }.merge(params)
    end
  end
end
