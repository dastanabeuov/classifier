# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Api::V1::Xroots', type: :request do
  path '/api/v1/xroots' do
    get 'Retrieves all xroots' do
      tags 'Xroots'
      produces 'application/json'
      security [Bearer: []]
      parameter name: :Authorization, in: :header, type: :string

      response '200', :success do
        include_context 'when authenticated'
        let(:xroots) { create_list(:xroot, 3, user: user) }
        run_test!
      end
    end

    post 'Creates a xroot' do
      tags 'Xroots'
      produces 'application/json'
      security [Bearer: []]
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :xroot, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          synonym: { type: :string },
          description: { type: :string },
          code: { type: :string },
          version_date: { type: :date },
          publish: { type: :boolean }
        },
        required: %w[title synonym description code version_date publish]
      }

      response '201', :created do
        include_context 'when authenticated'
        let(:xroot) do
          { title: 'foo', synonym: 'moo', description: 'bar',
            code: 'a-007', version_date: '2022-01-28', publish: false, user_id: user.id }
        end
        run_test!
      end
    end
  end

  path '/api/v1/xroots/{id}' do
    get 'Retrieves a xroot' do
      tags 'Xroots'
      produces 'application/json'
      security [Bearer: []]
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :id, in: :path, type: :string

      response '200', :success do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 title: { type: :string },
                 synonym: { type: :string },
                 description: { type: :string }
               },
               required: %w[id title synonym description]

        include_context 'when authenticated'
        let(:id) { create(:xroot, user: user).id }
        run_test!
      end
    end

    put 'Update xroot by id' do
      tags 'Xroots'
      produces 'application/json'
      security [Bearer: []]
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :id, in: :path, type: :integer

      parameter name: :xroot, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          title: { type: :string },
          synonym: { type: :string },
          description: { type: :string }
        },
        required: %w[id title synonym description]
      }
      response '200', :success do
        include_context 'when authenticated'
        let(:id) { create(:xroot, user: user).id }
        run_test!
      end
    end

    delete 'Delete a xroot' do
      tags 'Xroots'
      produces 'application/json'
      security [Bearer: []]
      parameter name: :Authorization, in: :header, type: :strings
      parameter name: :id, in: :path, type: :string

      response '204', :success do
        include_context 'when authenticated'
        let(:id) { create(:xroot, user: user).id }
        run_test!
      end
    end
  end
end
