# frozen_string_literal: true

FactoryBot.define do
  factory :xclass do
    sequence(:title) { |n| "MyString#{n}" }
    description { 'MyText' }
    synonym { 'MyString' }
    code { 'MyString' }
    sequence(:full_code) { |n| "MyString#{n}" }
    version_date { '2020-06-08' }
    publish { false }
    position { 'MyString' }
    ancestry { nil }
    xcategory_id { nil }
    user { nil }

    trait :invalid do
      title { nil }
    end
  end
end
