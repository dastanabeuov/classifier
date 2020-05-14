FactoryBot.define do
  factory :xclass do
    name {"Name"}
    description {"Description"}
  end

  trait :invalid_class do
  	name { nil }
  end  
end