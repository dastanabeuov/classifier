# frozen_string_literal: true

# FactoryBot.define do
#   factory :user do |_u|
#     sequence(:email) { |n| "user#{n}@gmail.com" }
#     admin { true }
#     guest { false }
#     password { '12345678' }
#     password_confirmation { '12345678' }
#     confirmed_at { Time.zone.now }
#     # after(:build, &:skip_confirmation_notification!)
#     # after(:create, &:confirm)
#   end
# end

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@test.com" }
    role { 2 }
    password { '12345678' }
    password_confirmation { '12345678' }
    confirmed_at { Time.zone.now }
  end

  trait :admin do
    admin { true }
  end
end
