FactoryBot.define do
  factory :xroot do
    name {"Name"}
    description {"Description"}
  end

  trait :invalid do
  	name { nil }
  end
end