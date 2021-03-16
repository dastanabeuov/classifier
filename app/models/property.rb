class Property < ApplicationRecord
  belongs_to :activity
  belongs_to :propertyable, polymorphic: true
  
  validates :name, presence: true, length: { minimum: 2 }
end
