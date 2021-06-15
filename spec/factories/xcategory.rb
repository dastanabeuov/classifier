FactoryBot.define do
  factory :xcategory do
    title { 'MyString' }
    synonym { 'MyString' }
    code { 'MyString' }
    version_date { '2020-06-08' }
    publish { false }
    xroot_id { nil }
    user { nil }

    trait :invalid do
      title { nil }
    end
  end
end
