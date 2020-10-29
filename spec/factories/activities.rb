FactoryBot.define do
  factory :activity do
    name { "MyString" }
    description { "MyText" }
    synonym { "MyText" }
    code { "MyString" }
    version_date { "2020-06-08" }
    publish { false }
    position { "MyString" }
    ancestry { "MyString" }
    user { nil }
  end
end
