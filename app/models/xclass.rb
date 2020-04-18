class Xclass < ApplicationRecord
  has_ancestry
  
  belongs_to :user
  belongs_to :xcategory

  has_many :properties, as: :propertyable, :inverse_of => :propertyable
end
