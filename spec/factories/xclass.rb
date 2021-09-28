FactoryBot.define do
  factory :xclass do
    title { 'MyString' }
    description { 'MyText' }
    synonym { 'MyString' }
    code { 'MyString' }
    full_code { 'MyString' }
    version_date { '2020-06-08' }
    publish { false }
    position { 'MyString' }
    ancestry { nil }
    xcategory_id { nil }
    user { nil }
  end
end
