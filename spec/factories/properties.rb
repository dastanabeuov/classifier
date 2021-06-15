FactoryBot.define do
  factory :property do
    title { 'MyString' }
    propertyable { nil }
    activity_id { nil }

    trait :invalid do
      title { nil }
    end
  end
end
