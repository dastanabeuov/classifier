class Property < ApplicationRecord
  belongs_to :propertyable, polymorphic: true, :inverse_of => :properties 
end
