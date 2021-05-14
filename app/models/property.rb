class Property < ApplicationRecord
  belongs_to :activity
  belongs_to :propertyable, polymorphic: true, touch: true
  
  validates :title, presence: true, length: { minimum: 2 }
end
