FactoryBot.define do
  factory :xroot do
    title { "MyString" }
    description { "MyText" }
    synonym { "MyString" }
    code { "MyString" }
    version_date { "2020-06-08" }
    publish { false }
    user { nil }

    trait :invalid do
      title { nil }
    end
  end
end