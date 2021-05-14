require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'xclasses' do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
  explanation 'xclasses are top-level business objects'

  get '/xclasses' do
    route_summary 'This URL gets the list of xclasses.'
    route_description 'Getting list of xclasses. Long Description'

    context '200' do
      example_request 'Getting list of xclasses' do
        do_request(params)
        expect(status).to eq(200)
      end
    end
  end

  post '/xclasses' do
    route_summary 'This is used to create xclasses.'

    with_options scope: :xclass, with_example: true do
      parameter :title, 'Doodle IT', required: true
      parameter :description, 'Doodling Information Technology'
    end

    with_options scope: :order do
      response_field :title, 'title', type: :string
      response_field :description, 'Description', type: :string
    end

    context '200' do
      let(:title) { 'Doodle IT' }
      let(:description) { 'Doodling Information Technology' }
      let(:raw_post) { params.to_json }

      example 'Create a xclass' do
        do_request(params)
        expect(status).to eq(201)
      end
    end
  end
end