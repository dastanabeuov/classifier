FactoryBot.define do
  factory :xcategory do
    name { "MyString" }
    description { "MyText" }
    synonym { "MyText" }
    code { "MyString" }
    version_date { "2020-06-08" }
    publish { false }
    xroot_id { nil }
    user { nil }
  end
end