# frozen_string_literal: true

RSpec.shared_context 'when authenticated' do
  security [bearer: []]

  let(:user) { create(:user) }
  let(:access_token) { create(:access_token, resource_owner_id: user.id) }
  let(:Authorization) { "Bearer #{access_token.token}" }
end
