FactoryBot.define do
  factory :property do
    name { "MyString" }
    description { "MyText" }
    propertyable { nil }
    activity_id { nil }
  end
end
