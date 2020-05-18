FactoryBot.define do
  factory :xroot do
    name {"Name"}
    description {"Description"}
  end

  trait :invalid_root do
  	name { nil }
  end
end