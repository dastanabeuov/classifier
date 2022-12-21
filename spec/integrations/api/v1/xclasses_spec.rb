# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Api::V1::Xclases', type: :request do
  path '/api/v1/xroots/{id}/xcategories/{id}/xclasses' do
    get 'show' do
      consumes 'application/json'
      produces 'application/json'

      include_context 'when authenticated'

      parameter name: :id, in: :path, type: :string

      let(:id) { create(:xroot, user: user).id }

      response '200', 'Xroot show' do
        run_test!

        schema type: :object, properties: { data: { '$ref': '#/components/schemas/xroot' } }
      end

      response '404', 'Xroot not found' do
        let(:id) { 'missed' }

        run_test!
      end

      response '403', 'User not logged in or not owner of xroot' do
        let(:Authorization) { nil }

        run_test!
      end
    end
  end
end
