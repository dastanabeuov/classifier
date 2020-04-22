class Xcategory < ApplicationRecord
  translates :name, :description, :synonym, :code, :version_date, :publish, :user_id, :xroot_id
  accepts_nested_attributes_for :translations, allow_destroy: true

  belongs_to :user
  belongs_to :xroot

  has_many :properties, as: :propertyable, :inverse_of => :propertyable
  has_many :xclasses, dependent: :destroy         
end
