class Property < ApplicationRecord
  belongs_to :propertyable, polymorphic: true, :inverse_of => :properties 

  #translates :content, :propertyable_id, :propertyable_type
  #accepts_nested_attributes_for :translations, allow_destroy: true  
end
