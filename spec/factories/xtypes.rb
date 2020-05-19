FactoryBot.define do
  factory :xtype do
    name { "MyString" }
    description { "MyText" }
    synonym { "MyText" }
    code { "MyString" }
    version_date { "2020-05-18" }
    publish { false }
    user_id { 1 }
  end
end
