class Property < ApplicationRecord
  translates :content
  accepts_nested_attributes_for :translations, allow_destroy: true

  belongs_to :propertyable, polymorphic: true, :inverse_of => :properties 
end
