require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'xcategories' do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
  explanation 'xcategories are top-level business objects'

  get 'xroot/1/xcategories' do
    route_summary 'This URL gets the list of xcategories.'
    route_description 'Getting list of xcategories. Long Description'

    context '200' do
      example_request 'Getting list of xcategories' do
        do_request(params)
        expect(status).to eq(200)
      end
    end
  end

  post 'xroot/1/xcategories' do
    route_summary 'This is used to create xcategories.'

    with_options scope: :xcategory, with_example: true do
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

      example 'Create a xcategory' do
        do_request(params)
        expect(status).to eq(201)
      end
    end
  end
end
