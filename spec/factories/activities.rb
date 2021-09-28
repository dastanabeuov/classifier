FactoryBot.define do
  factory :activity do
    title { 'MyString' }
    description { 'MyText' }
    synonym { 'MyString' }
    code { 'MyString' }
    version_date { '2020-06-08' }
    publish { false }
    position { 'MyString' }
    ancestry { nil }
    user { nil }
  end
end
