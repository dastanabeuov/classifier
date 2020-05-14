class Property < ApplicationRecord
  belongs_to :propertyable, polymorphic: true, :inverse_of => :properties 	
  
  validates :propertyable_type, presence: true

  translates :content
  accepts_nested_attributes_for :translations, allow_destroy: true
end
