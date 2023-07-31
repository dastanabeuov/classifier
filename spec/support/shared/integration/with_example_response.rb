# frozen_string_literal: true

RSpec.shared_context 'with example response' do
  after do |example|
    example.metadata[:response][:content] = {
      'application/json' => {
        example: Oj.load(response.body, symbolize_names: true)
      }
    }
  end
end
