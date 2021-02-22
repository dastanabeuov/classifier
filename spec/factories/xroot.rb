FactoryBot.define do
  factory :xroot do
    name { "MyString" }
    description { "MyText" }
    synonym { "MyText" }
    code { "MyString" }
    version_date { "2020-06-08" }
    publish { false }
    user { nil }

    trait :invalid do
      name { nil }
    end
  end
end