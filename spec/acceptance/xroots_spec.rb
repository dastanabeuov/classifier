require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'xroots' do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
  explanation 'xroots are top-level bussiness object'

  get '/xroots' do
    route_summary 'This URL gets the list of xroots'
    route_description 'Xroots is root path all models trees.'

    context '200' do
      example_request 'Getting list of Xroots' do
        expect(status).to eq(200)
        do_request(xroots_path)
      end
    end
  end

  post 'xroots' do
    route_summary 'this is used to create Xroots'

    with_options scope: :xroot, with_example: true do
      parameter :name, 'Doodle IT', require: true
      parameter :description, 'Doodling Information Technology'
    end

    with_options scope: :order do
      response_field :name, 'Name', type: :string
      response_field :description, 'Description', type: :string
    end

    context '200' do
      let(:name) { 'Doodle IT' }
      let(:description) { 'Doodling Information Technology' }
      let(:raw_post) { params.to_json }
    end

    example 'create a xroot' do
      do_request(params)
      expect(status).to eq(201)
    end
  end
end