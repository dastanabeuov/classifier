# frozen_string_literal: true

FactoryBot.define do
  factory :oauth_application, class: 'Doorkeeper::Application' do
    sequence(:name) { |n| "Name#{n}" }
    redirect_uri { 'urn:ietf:wg:oauth:2.0:oob' }
    uid { '1234567890' }
    secret { '0987654321' }
  end
end
