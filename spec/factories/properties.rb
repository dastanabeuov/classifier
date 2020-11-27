FactoryBot.define do
  factory :property do
    name { "MyString" }
    description { "MyText" }
    propertyable { nil }
    user { nil }
  end
end
