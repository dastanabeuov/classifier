require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'activities' do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
  explanation 'activities are top-level business objects'

  get '/activities' do
    route_summary 'This URL gets the list of activities.'
    route_description 'Getting list of activities. Long Description'

    context '200' do
      example_request 'Getting list of activities' do
        expect(status).to eq(200)
        # do_request(param)
      end
    end
  end

  post '/activities' do
    route_summary 'This is used to create activities.'

    with_options scope: :property, with_example: true do
      parameter :name, 'Doodle IT', required: true
      parameter :description, 'Doodling Information Technology'
    end

    with_options scope: :order do
      response_field :name, 'Doodle IT', type: :text
      response_field :description, 'Doodling Information Technology', type: :string
    end

    context '200' do
      let(:name) { 'Doodle IT' }
      let(:description) { 'Doodling Information Technology' }
      let(:raw_post) { params.to_json }

      example 'Create a property' do
        do_request(params)
        expect(status).to eq(201)
      end
    end
  end
end