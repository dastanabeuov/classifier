class Xclass < ApplicationRecord
  belongs_to :user
  belongs_to :xcategory, touch: true
  
  has_many :properties, dependent: :destroy, as: :propertyable

  accepts_nested_attributes_for :properties, reject_if: :all_blank, allow_destroy: true
  
  has_ancestry

  validates :name, presence: true, length: { minimum: 2 } 
end
