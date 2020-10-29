class Xclass < ApplicationRecord
  belongs_to :user
  belongs_to :xcategory
  
  has_many :properties, dependent: :destroy, as: :propertyable

  accepts_nested_attributes_for :properties, reject_if: :all_blank, allow_destroy: true
  
  has_ancestry
  
  translates :name, :description, :synonym
end
