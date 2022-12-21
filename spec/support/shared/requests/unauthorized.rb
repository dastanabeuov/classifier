# frozen_string_literal: true

shared_examples_for 'Unauthorized' do
  context 'unauthorized' do
    it 'returns 401 status if there is no access_token' do
      do_request(method, api_path, headers: headers)
      expect(response.status).to eq 401
    end

    it 'returns 401 status if access_token is invalid' do
      do_request(method, api_path, params: { access_token: '1234', format: :json })
      expect(response.status).to eq 401
    end
  end
end
