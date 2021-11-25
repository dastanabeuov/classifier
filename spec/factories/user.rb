# frozen_string_literal: true

FactoryBot.define do
  factory :user do |_u|
    sequence(:email) { |n| "user#{n}@gmail.com" }
    password { '123456' }
    password_confirmation { '123456' }
    admin { true }
    guest { false }
    after(:build, &:skip_confirmation_notification!)
    after(:create, &:confirm)
  end
end
