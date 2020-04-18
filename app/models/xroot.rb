class Xroot < ApplicationRecord
  belongs_to :user

  has_many :properties, as: :propertyable, :inverse_of => :propertyable
  has_many :xcategories, dependent: :destroy  
end
