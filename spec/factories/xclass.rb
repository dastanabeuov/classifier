FactoryBot.define do
  factory :xclass do
    name { "MyString" }
    description { "MyText" }
    synonym { "MyText" }
    code { "MyString" }
    version_date { "2020-06-08" }
    publish { false }
    position { "MyString" }
    ancestry { "MyString" }
    xcategory_id { nil }
    user { nil }
  end
end