FactoryBot.define do
  factory :property do
    propertyable_type { "Xroot" }
    propertyable_id { "1" }
  end

  trait :invalid_property do
  	propertyable_type { nil }
  end
end