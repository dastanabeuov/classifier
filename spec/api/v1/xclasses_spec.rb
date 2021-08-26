require 'rails_helper'

describe 'xclasses API', type: :request do
  let(:headers) { { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' } }
  let(:user) { create(:user) }
  let(:access_token) { create(:access_token, resource_owner_id: user.id) }

  let(:xroot) { create(:xroot, user: user) }
  let(:xcategory) { create(:xcategory, xroot: xroot, user: user) }

  describe 'GET /index' do
    let(:api_path) { '/api/v1/xroot/#{xroot.id}/xcategories/#{xcategory.id}/xclasses' }

    it_behaves_like 'API Authorizable' do
      let(:method) { :get }
    end

    context 'authorized' do
      let(:xclasses) { create_list(:xclass, 2, xcategory: xcategory, user: user) }
      let(:xclass) { xclasses.first }
      let(:xclass_response) { json['xclasses'].first }

      before { get api_path, params: { access_token: access_token.token }, headers: headers }

      it 'returns 200 status' do
        expect(response).to be_successful
      end

      it 'returns list of xclasses' do
        expect(json['xclasses'].size).to eq 2
      end

      it 'returns all public fields' do
        %w[id title describtion synonym code full_code version_date publish xtype position ancestry xcategory_id user_id
           created_at updated_at].each do |attr|
          expect(xclass_response[attr]).to eq xclass.send(attr).as_json
        end
      end

      it 'contains user object' do
        expect(xclass_response['user']['id']).to eq xclass.user.id
      end

      describe 'xclasses in xclass' do
        it 'returns list of xclasses' do
          expect(xclass_response['xclasses'].size).to eq 2
        end

        it 'returns all public fields xclass' do
          %w[id title describtion synonym code full_code version_date publish xtype position ancestry xcategory_id user_id
             created_at updated_at].each do |attr|
            expect(xclass_response[attr]).to eq xclass.send(attr).as_json
          end
        end
      end
    end
  end

  describe 'GET /show' do
    let(:api_path) { '/api/v1/xroots/#{xroot.id}/xcategories/#{xcategory.id}/xclasses/#{xclass.id}' }

    it_behaves_like 'API Authorizable' do
      let(:method) { :get }
    end

    context 'Authorized' do
      let(:xclass) { create(:xclass, xcategory: xcategory, user: user) }
      let(:activity) { create_list(:activity, user: user) }
      let(:properties) { create(:property, 3, propertyable: xclass, activity: activity) }

      before { get api_path, params: { format: :json, access_token: access_token.token } }

      it '- returns 200 status' do
        expect(response).to have_http_status(200)
      end

      context '- contains' do
        %w[id title describtion synonym code full_code version_date publish xtype position ancestry xcategory_id user_id
           created_at updated_at].each do |attr|
          it "- #{attr}" do
            expect(response.body).to be_json_eql(xclass.send(attr.to_sym).to_json).at_path(attr.to_s)
          end
        end
      end

      context '- properties ' do
        it '- included in xclass object' do
          expect(response.body).to have_json_size(properties.size).at_path('properties')
        end
      end
    end

    def send_request(params = {})
      get api_path, params: { format: :json }.merge(params)
    end
  end

  describe 'POST /create' do
    let(:api_path) { '/api/v1/xroots/#{xroot.id}/xcategories/#{xcategory.id}/xclasses' }

    it_behaves_like 'API Authorizable' do
      let(:method) { :post }
    end

    context 'Authorized' do
      let(:attrs) { attributes_for(:xclass, xcategory: xcategory, user: user) }
      let(:invalid_attrs) { attributes_for(:xclass, title: :invalid, xcategory: xcategory, user: user) }

      context '- invalid attributes' do
        it '- returns 422 status' do
          post api_path, params: { access_token: access_token.token, xclass: invalid_attrs, format: :json }
          expect(response).to have_http_status(422)
        end
      end

      context '- valid attributes' do
        before { post api_path, params: { access_token: access_token.token, xclass: attrs, format: :json } }

        it '- returns status 201-Created' do
          expect(response).to have_http_status(201)
        end

        %w[id title describtion synonym code full_code version_date publish xtype position ancestry xcategory_id user_id
           created_at updated_at].each do |attr|
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
      get api_path, params: { format: :json }.merge(params)
    end
  end
end
