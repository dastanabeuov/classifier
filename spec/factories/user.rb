FactoryBot.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end

  factory :user do |u|
    email
    password { '12345678' }
    password_confirmation { '12345678' }
    after(:create)  { |u| u.confirm }
  end
end