FactoryBot.define do
  factory :xclass do
    title { 'MyString' }
    description { 'MyText' }
    synonym { 'MyString' }
    code { 'MyString' }
    full_code { 'MyText' }
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
