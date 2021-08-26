class Xclass < ApplicationRecord
  belongs_to :user
  belongs_to :xcategory, touch: true

  has_many :properties, dependent: :destroy, as: :propertyable

  accepts_nested_attributes_for :properties, reject_if: :all_blank, allow_destroy: true

  has_ancestry cache_depth: true

  validates :title, presence: true, length: { minimum: 2 }
  validates :full_code, uniqueness: true
end
