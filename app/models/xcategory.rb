class Xcategory < ApplicationRecord
  belongs_to :user
  belongs_to :xroot

  has_many :xclasses, dependent: :destroy
  has_many :properties, dependent: :destroy, as: :propertyable

  accepts_nested_attributes_for :properties, reject_if: :all_blank, allow_destroy: true

  translates :name, :description, :synonym
end
