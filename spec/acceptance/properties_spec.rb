require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'properties' do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
  explanation 'properties are top-level business objects'

  get '/properties' do
    route_summary 'This URL gets the list of properties.'
    route_description 'Getting list of properties. Long Description'

    context '200' do
      example_request 'Getting list of properties' do
        expect(status).to eq(200)
        # do_request(param)
      end
    end
  end

  post '/properties' do
    route_summary 'This is used to create properties.'

    with_options scope: :property, with_example: true do
      parameter :content, 'Doodle IT', required: true
      parameter :propertyable_type, 'Xroot'
      parameter :propertyable_id, '1'
    end

    with_options scope: :order do
      response_field :content, 'Doodle IT', type: :text
      response_field :propertyable_type, 'Xroot', type: :string
      response_field :propertyable_id, '1', type: :integer
    end

    context '200' do
      let(:content) { 'Doodle IT' }
      let(:propertyable_type) { 'Xroot' }
      let(:propertyable_id) {'1'}
      let(:raw_post) { params.to_json }

      example 'Create a property' do
        do_request(params)
        expect(status).to eq(201)
      end
    end
  end
end