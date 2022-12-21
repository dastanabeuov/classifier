# frozen_string_literal: true

FactoryBot.define do
  factory :property do
    sequence(:title) { |n| "MyString#{n}" }
    propertyable { nil }
    activity_id { nil }

    trait :invalid do
      title { nil }
    end
  end
end
