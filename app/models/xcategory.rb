class Xcategory < ApplicationRecord
  belongs_to :xroot

  has_ancestry

  has_many :xclasses, dependent: :destroy
  has_many :properties, as: :propertyable, :inverse_of => :propertyable

  validates :name, presence: true

  translates :name, :description, :synonym
  accepts_nested_attributes_for :translations, allow_destroy: true
end
